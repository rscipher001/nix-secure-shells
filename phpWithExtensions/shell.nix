{
  pkgs ? import <nixpkgs> { },
}:
let
  php = pkgs.php84.withExtensions ({ enabled, all }: enabled ++ [ all.grpc ]);
in
pkgs.mkShell {
  nativeBuildInputs = [
    php
    php.packages.composer
    pkgs.intelephense
  ];
}
