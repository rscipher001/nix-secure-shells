{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShellNoCC {
  nativeBuildInputs = with pkgs; [
    php85
    php85.packages.composer
  ];
}
