{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "san-francisco";
  version = "2019-02-09";

  # https://github.com/supermarin/YosemiteSanFranciscoFont
  src = fetchFromGitHub {
    owner = "blaisck";
    repo = "sfwin";
    rev = "41e809c96b84a839395a3fb973431471d9e2aced";
    sha256 = "14k6r7jia5h4vd2adrpikswzbb5g5myf4jwq5iag528kyan9b6za";
  };

  installPhase = ''
    mkdir -p $out/share/fonts/{SFPro,SFMono,SFCompact}

    mv SFPro/TrueType/*.ttf $out/share/fonts/SFPro
    mv SFMono/TrueType/*.ttf $out/share/fonts/SFMono
    mv SFCompact/TrueType/*.ttf $out/share/fonts/SFCompact
  '';
}
