{ stdenv, pkgs, makeDesktopItem }:
let
  pname = "slicer";
  version = "4.11.20200930";
  desktopItem = makeDesktopItem {
    name = "slicer";
    exec = "Slicer";
    comment = "3d slicer.";
    desktopName = "slicer";
    genericName = "3D Slicer";
    categories = "X-Browser;";
  };
in stdenv.mkDerivation rec {

  name = "${pname}-${version}";

  src = pkgs.fetchurl {
    name = "Slicer-4.11.0-2020-09-30-linux-amd64.tar.gz";
    url = "https://download.slicer.org/bitstream/1341035";
    sha256 = "1zkndhpyp3d3xg6hsbjs2znvdybn90kw6rg8273xn0c3986galrm";
  };

  libPath = pkgs.lib.makeLibraryPath ([
    pkgs.stdenv.cc.cc
    pkgs.pkgs.xorg.libX11
    pkgs.zlib
    pkgs.libxml2
    pkgs.cups
    pkgs.pango
    pkgs.atk
    pkgs.gtk2
    pkgs.glib
    pkgs.gdk-pixbuf
    pkgs.zlib
    pkgs.bzip2
    pkgs.sqlite
    pkgs.unixODBC
    pkgs.python36Full
    pkgs.python36Packages.numpy

  ] ++ (with pkgs.qt5; [ qtbase qtsvg qtwebengine qtscript qtxmlpatterns ]));

  buildInputs = [
    pkgs.gcc-unwrapped
    pkgs.autoPatchelfHook

    pkgs.stdenv.cc.cc
    pkgs.xorg.libX11
    pkgs.zlib
    pkgs.libxml2
    pkgs.cups
    pkgs.pango
    pkgs.atk
    pkgs.gtk2
    pkgs.glib
    pkgs.gdk-pixbuf
    pkgs.zlib
    pkgs.bzip2
    pkgs.sqlite
    pkgs.xorg.libXt
    pkgs.libGLU
    pkgs.unixODBC
    pkgs.python36Full
    pkgs.python36Packages.numpy

    pkgs.mysql57
    pkgs.postgresql.lib

  ] ++ (with pkgs.qt5; [ qtbase qtsvg qtwebengine qtscript qtxmlpatterns ]);

  installPhase = ''
    mkdir -p $out/bin
    mv * $out/bin
    echo interpreter is $(cat $NIX_CC/nix-support/dynamic-linker)

    ln -s ${desktopItem}/share $out/share
  '';
}
