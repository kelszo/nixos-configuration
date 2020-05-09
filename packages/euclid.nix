{ fetchFromGitHub, stdenv }:
stdenv.mkDerivation rec {
  name = "euclid-mover";

  src = fetchFromGitHub {
    owner = "Chrysostomus";
    repo = "bspwm-scripts";
    rev = "c5041d83742d04c1afe73abc90a32c527c8a9eec";
    sha256 = "1nw7k9ikzn3nhz7by9ik6paryfz1j4lhqhf4cnzfi71h4b42jz2c";
  };

  phases = "installPhase";

  installPhase = ''
    mkdir -p $out/bin
    cp ${src}/bin/euclid_mover $out/bin
    cp ${src}/bin/euclid_balancer $out/bin
    chmod +x $out/bin/euclid_mover
    chmod +x $out/bin/euclid_balancer
  '';
}
