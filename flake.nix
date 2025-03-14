{
  description = "monadam's nice config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    my-nixpkgs.url = "path:/home/adam/projects/nix/nixpkgs/nixpkgs/";

    nixos-hardware.url = "github:nixos/nixos-hardware";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # secrets

    agenix.url = "github:ryantm/agenix";

    nix-search.url = "github:diamondburned/nix-search";

    # hyprland

    hyprland.url =
      "git+https://github.com/hyprwm/Hyprland?submodules=1&ref=refs/tags/v0.41.2";

    hyprland-hy3.url = "github:outfoxxed/hy3?ref=hl0.41.2";
    hyprland-hy3.inputs.hyprland.follows = "hyprland";

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins?ref=refs/tags/v0.41.2";
      inputs.hyprland.follows = "hyprland";
    };

    hyprlock.url = "github:hyprwm/hyprlock";

    # emacs

    emacs-overlay.url = "github:nix-community/emacs-overlay";
    emacs-overlay.inputs.nixpkgs-stable.follows = "nixpkgs";
    emacs-overlay.inputs.nixpkgs.follows = "nixpkgs";

    # vim

    # nixvim.url = "github:nix-community/nixvim/nixos-24.05";
    # nixvim.inputs.nixpkgs.follows = "nixpkgs";

  };

  outputs = { self, agenix, nixpkgs, home-manager, ... }@inputs:
    let
      pkgs = import nixpkgs { config.allowUnfree = true; };
      lib = import ./lib {
        inherit self;
        inherit (nixpkgs) lib;
        inherit pkgs;
      };
      supportedSystems = [ "x86_64-linux" ];
      forEachSupportedSystem = f:
        nixpkgs.lib.genAttrs supportedSystems
          (system: f { pkgs = import nixpkgs { inherit system; }; });
      system = "x86_64-linux";
    in
    {
      nixosConfigurations = {

        iron = nixpkgs.lib.nixosSystem rec {
          inherit system;

          specialArgs = {
            inherit inputs;
            inherit system;
            inherit lib; # w custom libs
          };

          modules = (lib.mapModulesRec' ./modules lib.id) ++ [
            { nixpkgs.config.allowUnfree = true; }
            ./host/iron/default.nix
            home-manager.nixosModules.home-manager
            agenix.nixosModules.default
            # inputs.nixvim.nixosModules.nixvim
            {
              home-manager = {
                extraSpecialArgs = { inherit inputs; };
                backupFileExtension = "bak";
                verbose = true;
                useGlobalPkgs = true;
                useUserPackages = true;
                users.adam = import ./home/adam;
              };
            }
          ];
        };
      };
      devShells = forEachSupportedSystem ({ pkgs }: {
        default = pkgs.mkShell {
          packages = with pkgs; [
            nixpkgs-fmt
            agenix.packages.x86_64-linux.default
          ];
          inherit system;
        };
      });
    };
}
