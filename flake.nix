{
  description = "Per-project devshell flake templates (plain and nixpak-sandboxed variants)";

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
        deno = {
          path = ./deno;
          description = "Deno";
        };
        deno-nixpak = {
          path = ./deno-nixpak;
          description = "Sandboxed Deno using nixpak";
        };
        go = {
          path = ./go;
          description = "Go";
        };
        go-nixpak = {
          path = ./go-nixpak;
          description = "Sandboxed Go using nixpak";
        };
        node = {
          path = ./node;
          description = "Node";
        };
        node-nixpak = {
          path = ./node-nixpak;
          description = "Sandboxed Node using nixpak";
        };
        php = {
          path = ./php;
          description = "PHP";
        };
        php-nixpak = {
          path = ./php-nixpak;
          description = "Sandboxed PHP using nixpak";
        };
        phpWithExtensions = {
          path = ./phpWithExtensions;
          description = "PHP with extensions";
        };
        phpWithExtensions-nixpak = {
          path = ./phpWithExtensions-nixpak;
          description = "Sandboxed PHP with extensions using nixpak";
        };
        rust = {
          path = ./rust;
          description = "Rust";
        };
        rust-nixpak = {
          path = ./rust-nixpak;
          description = "Sandboxed Rust using nixpak";
        };
      };

      defaultTemplate = self.templates.rust;
    };
}
