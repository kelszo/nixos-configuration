{ fetchFromGitHub, stdenv }:
stdenv.mkDerivation rec {
  name = "minimalism-gnome-shell";
  version = "1";

  src = fetchFromGitHub {
    owner = "Edenhofer";
    repo = name;
    rev = "e32d6312c454a5474f88be660dabce0d2e217c00";
    sha256 = "0ibp3vmv3lw9xpw3psxrr8rbkzv6c09sbryyn5xbr8m5pp2mvyas";
  };

  installPhase = ''
    mkdir -p $out/share/gnome-shell/extensions/hide-dash@xenatt.github.com
    mv hide-dash@xenatt.github.com/* $out/share/gnome-shell/extensions/hide-dash@xenatt.github.com

    mkdir -p $out/share/gnome-shell/extensions/hide-workspace@xenatt.github.com
    mv hide-workspace@xenatt.github.com/* $out/share/gnome-shell/extensions/hide-workspace@xenatt.github.com
  '';
}
