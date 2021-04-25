{ fetchFromGitHub, stdenv }:
stdenv.mkDerivation rec {
  name = "wintile";
  version = "6";

  src = fetchFromGitHub {
    owner = "Fmstrat";
    repo = name;
    rev = "v${version}";
    sha256 = "07fvyc11zpdlfy3q1gm73sp19jjpzzzl4wf2rqf5gh4vf7azqrqr";
  };

  uuid = "wintile@nowsci.com";

  installPhase = ''
    mkdir -p $out/share/gnome-shell/extensions/${uuid}
    rm demo.gif README.md build.sh
    mv * $out/share/gnome-shell/extensions/${uuid}
  '';
}
