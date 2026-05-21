{
  pkgs ? import <nixpkgs> { },
  mkNixPak,
}:
let
  php = pkgs.php84.withExtensions ({ enabled, all }: enabled ++ [ all.grpc ]);
  sandbox =
    pkg:
    (mkNixPak {
      config =
        { sloth, ... }:
        {
          app.package = pkg;
          bubblewrap = {
            network = true;
            bind.rw = [
              (sloth.env "PWD")
            ];
          };
        };
    }).config.script;
in
pkgs.mkShellNoCC {
  nativeBuildInputs = [
    (sandbox php)
    (sandbox php.packages.composer)
    (sandbox pkgs.intelephense)
  ];
}
