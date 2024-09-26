{
  description = "monadam's nice config";

  inputs = {
    nixos-hardware.url = "github:nixos/nixos-hardware";
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    nixpkgs.url = "nixpkgs/nixos-24.05";
    nixpkgs-my.url = "path:/home/adam/code/nixpkgs";

    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-search.url = "github:diamondburned/nix-search";

    hyprland.url =
      "git+https://github.com/hyprwm/Hyprland?submodules=1&ref=refs/tags/v0.41.2";

    hyprland-hy3.url = "github:outfoxxed/hy3?ref=hl0.41.2";
    hyprland-hy3.inputs.hyprland.follows = "hyprland";

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins?ref=refs/tags/v0.41.2";
      inputs.hyprland.follows = "hyprland";
    };

    hyprland-virtual-desktops = {
      url = "github:levnikmyskin/hyprland-virtual-desktops";
      inputs.hyprland.follows = "hyprland";
    };

    hyprlock.url = "github:hyprwm/hyprlock";

    emacs-overlay.url = "github:nix-community/emacs-overlay";
    emacs-overlay.inputs.nixpkgs-stable.follows = "nixpkgs";
    emacs-overlay.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim/nixos-24.05";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";

  };

  outputs = { self, nix-search, nixpkgs, home-manager, ... }@inputs:
    let
      pkgs = import nixpkgs { };
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
    in {
      nixosConfigurations = {

        iron = nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";

          specialArgs = {
            inherit inputs;
            inherit system;
            inherit lib; # w custom libs
          };

          modules = (lib.mapModulesRec' ./modules lib.id) ++ [
            ./host/iron/default.nix
            { nixpkgs.config.allowUnfree = true; }
            inputs.nixvim.nixosModules.nixvim
            home-manager.nixosModules.home-manager
            {
              programs.nixvim.enable = true;
              programs.nixvim.plugins = {
                lazy.enable = true;
                lightline.enable = true;
              };
              environment.systemPackages =
                [ nix-search.packages.${system}.default ];
            }
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
          packages = [ ];
          inherit system;
        };
      });
    };
}
