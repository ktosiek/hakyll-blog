{ pkgs ? import <nixpkgs> {} }:

let
  blog-generator = pkgs.haskellPackages.callPackage ./default.nix {};
in {
  blog = with pkgs; stdenv.mkDerivation {
    name = "blog";
    src = ./.;
    buildPhase = ''
      locale
      export LOCALE_ARCHIVE=${glibcLocales}/lib/locale/locale-archive
      export LC_ALL=en_US.UTF-8

      ${blog-generator}/bin/site build
    '';

    installFlags = [ "DESTDIR=$(out)" ];
  };
}
