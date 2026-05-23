{
  pkgs ? import <nixpkgs> { },
  mkNixPak,
}:

let
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
    (sandbox pkgs.go)
  ];
}
