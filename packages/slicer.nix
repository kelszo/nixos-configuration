{ stdenv, pkgs, makeDesktopItem }:
let
  pname = "slicer";
  version = "4.13.20210416";
  desktopItem = makeDesktopItem {
    name = "slicer";
    exec = "Slicer";
    comment = "3d slicer.";
    desktopName = "slicer";
    genericName = "3D Slicer";
    categories = "X-Browser;";
  };
in
stdenv.mkDerivation rec {

  name = "${pname}-${version}";

  src = pkgs.fetchurl {
    name = "Slicer-4.13.0-2021-04-16-linux-amd64.tar.gz";
    url = "https://download.slicer.org/bitstream/1476965";
    sha256 = "028ksmmpicnw6y6qnvnam5n54aha7agh2jmnw3yd0bp7js6jd52a";
  };

  libPath = pkgs.lib.makeLibraryPath (
    [
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
      pkgs.python39Full
      pkgs.python39Packages.numpy

    ] ++ (with pkgs.qt5; [ qtbase qtsvg qtwebengine qtscript qtxmlpatterns ])
  );

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
    pkgs.python39Full
    pkgs.python39Packages.numpy

    pkgs.mysql57
    pkgs.postgresql.lib

  ] ++ (with pkgs.qt5; [ qtbase qtsvg qtwebengine qtscript qtxmlpatterns ]);

  dontWrapQtApps = true;

  installPhase = ''
    mkdir -p $out/bin
    mv * $out/bin
    echo interpreter is $(cat $NIX_CC/nix-support/dynamic-linker)

    ln -s ${desktopItem}/share $out/share
  '';
}
