{ nixpkgs ? import <nixpkgs> {} }:

let

  inherit (nixpkgs) pkgs;

  f = { mkDerivation, base, hakyll, stdenv }:
      mkDerivation {
        pname = "www";
        version = "0.1.0.0";
        src = ./.;
        isLibrary = false;
        isExecutable = true;
        buildDepends = [ base hakyll ];
        license = stdenv.lib.licenses.unfree;
      };

  drv = pkgs.haskellPackages.callPackage f {};

in

  if pkgs.lib.inNixShell then drv.env else drv
