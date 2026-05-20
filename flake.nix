{
  description = "Per-project devshell flake templates";

  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  outputs =
    { self, nixpkgs }:

    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system}.default = import ./shell.nix { inherit pkgs; };
      templates = {
        rust = {
          path = ./rust;
          description = "Rust shell";
        };
        python = {
          path = ./python;
          description = "Python shell";
        };
        php = {
          path = ./php;
          description = "PHP shell";
        };
        go = {
          path = ./go;
          description = "Go shell";
        };
        node = {
          path = ./node;
          description = "Node shell";
        };
        deno = {
          path = ./deno;
          description = "Deno shell";
        };
        haskell = {
          path = ./haskell;
          description = "Haskell shell";
        };
      };

      defaultTemplate = self.templates.rust;
    };
}
