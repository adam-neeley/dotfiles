{ config, lib, pkgs, ... }:

{
  config = {
    environment.systemPackages = with pkgs; [
      clang
      clang-tools
      # C++
      # Clangd from clang-tools must come first.
      # (clang-tools.override {
      #   llvmPackages = llvmPackages_16;
      #   enableLibcxx = false;
      # })
      # llvmPackages_16.libclang
      glibc
      cmake
      libcxx
      ccls
      gcc
      libtool
      libclang
      cmake-language-server
    ];
  };
}
