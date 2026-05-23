{
  description = "PHP shell";
  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  inputs.nixpak = {
    url = "github:nixpak/nixpak";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs =
    { nixpak, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      mkNixPak = nixpak.lib.nixpak {
        inherit (pkgs) lib;
        inherit pkgs;
      };
    in
    {
      devShells.${system}.default = import ./shell.nix { inherit pkgs mkNixPak; };
    };
}
