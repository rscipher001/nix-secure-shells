{
  description = "Rust shell";
  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  inputs.nixpak = {
    url = "github:nixpak/nixpak";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs =
    { nixpak, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      mkNixPak = nixpak.lib.nixpak {
        inherit (pkgs) lib;
        inherit pkgs;
      };
    in
    {
      devShells.${system}.default = import ./shell.nix { inherit pkgs mkNixPak; };
    };
}
