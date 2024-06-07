{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
    let pkgs = import nixpkgs {inherit system;}; in
      with pkgs; {
        devShells = {
          default = mkShell {
            name = "infografia-animation-dev";
            buildInputs = [ nodejs_20 nodePackages.pnpm just ];
          };
        };
      });
}
