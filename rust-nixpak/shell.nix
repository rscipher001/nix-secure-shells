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
pkgs.mkShell {
  buildInputs = [ pkgs.glib ];
  nativeBuildInputs = [
    pkgs.pkg-config
    (sandbox pkgs.cargo)
    (sandbox pkgs.clippy)
    (sandbox pkgs.rust-analyzer)
    (sandbox pkgs.rustc)
    (sandbox pkgs.rustfmt)
  ];
  env.RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
}
