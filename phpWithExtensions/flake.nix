{
  description = "PHP shell";
  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  outputs =
    { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = import nixpkgs {
        inherit system;
        # Explicitly allow unfree software
        config.allowUnfreePredicate =
          pkg:
          builtins.elem (lib.getName pkg) [
            "intelephense"
          ];
      };
    in
    {
      devShells.${system}.default = import ./shell.nix { inherit pkgs; };
    };
}
