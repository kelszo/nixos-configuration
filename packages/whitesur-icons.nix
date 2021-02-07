{ stdenv, fetchFromGitHub, gtk3, luna-icons }:

stdenv.mkDerivation rec {
  pname = "WhiteSur-icon-theme";
  version = "2020-10-11";

  # https://github.com/vinceliuice/WhiteSur-icon-theme
  src = fetchFromGitHub {
    owner = "vinceliuice";
    repo = pname;
    rev = "1a2b5ce30205430a9a2a5e6201e21ff8d7a840b6";
    sha256 = "13dsm48avkw9105wnf0dl584m9xs4hfq5pqrinavbf80jxxb3jjv";
  };

  nativeBuildInputs = [ gtk3 ];

  propagatedBuildInputs = [ luna-icons ];

  dontDropIconThemeCache = true;

  installPhase = ''
    mkdir -p $out/share/icons/whitesur
    cp -r src/index.theme $out/share/icons/whitesur

    mkdir -p $out/share/icons/whitesur/status
    cp -r src/{actions,animations,apps,categories,devices,emblems,mimes,places} $out/share/icons/whitesur

    cp -r src/status/{16,22,24,32,symbolic} $out/share/icons/whitesur/status
    cp -r links/{actions,apps,devices,emblems,mimes,places,status} $out/share/icons/whitesur

    ln -sf $out/share/icons/whitesur/actions $out/share/icons/whitesur/actions@2x
    ln -sf $out/share/icons/whitesur/animations $out/share/icons/whitesur/animations@2x
    ln -sf $out/share/icons/whitesur/apps $out/share/icons/whitesur/apps@2x
    ln -sf $out/share/icons/whitesur/categories $out/share/icons/whitesur/categories@2x
    ln -sf $out/share/icons/whitesur/devices $out/share/icons/whitesur/devices@2x
    ln -sf $out/share/icons/whitesur/emblems $out/share/icons/whitesur/emblems@2x
    ln -sf $out/share/icons/whitesur/mimes $out/share/icons/whitesur/mimes@2x
    ln -sf $out/share/icons/whitesur/places $out/share/icons/whitesur/places@2x
    ln -sf $out/share/icons/whitesur/status $out/share/icons/whitesur/status@2x

    for theme in $out/share/icons/*; do
      gtk-update-icon-cache $theme
    done
  '';
}
