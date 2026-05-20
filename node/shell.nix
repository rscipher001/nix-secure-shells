{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShellNoCC {
  nativeBuildInputs = with pkgs; [
    nodejs_24
    pnpm
    typescript
    typescript-language-server
    biome
    just
  ];

  shellHook = ''
    alias npm=pnpm
  '';
}
