{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }: let
    system = "aarch64-darwin";
  in let
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    devShells.${system}.default = pkgs.mkShell {
      name = "dsa-devshell-${system}";
      buildInputs = [
        pkgs.gcc14
        pkgs.gtest
        pkgs.meson
      ];
    };
  };
}
