{ appimageTools
, makeDesktopItem
, fetchurl
, pkgs
}:
let
  version = "2.6.6";
  desktopItem = makeDesktopItem {
    name = "Github Desktop";
    exec = "github-desktop";
    comment = "Github Desktop";
    desktopName = "github-desktop";
    genericName = "Github Desktop";
    categories = "X-Browser;";
  };
in
appimageTools.wrapType2 {
  name = "github-desktop";
  src = fetchurl {
    url = "https://github.com/shiftkey/desktop/releases/download/release-${version}-linux1/GitHubDesktop-linux-${version}-linux1.AppImage";
    sha256 = "1z2w2j6lff74zi8ppwrppkdhl0av2h04bc4rqhy1h2c5xsjj6cgs";
  };

  extraPkgs = pkgs: with pkgs; [
    git
    gnome3.libsecret
    gnome3.gnome-keyring
    gnome2.GConf
    curl
    xprintidle-ng
    nss
    nspr
    unzip
    desktopItem
  ];
}
