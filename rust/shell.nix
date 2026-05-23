{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    cargo
    clippy
    glib
    rust-analyzer
    rustc
    rustfmt
  ];
  nativeBuildInputs = [ pkgs.pkg-config ];
  env.RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
}
