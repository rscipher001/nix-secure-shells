{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShellNoCC {
  nativeBuildInputs = with pkgs; [
    nodejs_24
    pnpm
  ];

  shellHook = ''
    alias npm=pnpm
  '';
}
