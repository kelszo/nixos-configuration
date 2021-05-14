{ appimageTools
, curl
, fetchurl
, git
, glib
, gnome2
, gnome3
, gsettings-desktop-schemas
, gtk3
, nspr
, nss
, unzip
, xprintidle-ng
}:
let
  pname = "github-desktop";
  version = "2.6.6";
  name = "${pname}-${version}";
  src = fetchurl {
    url = "https://github.com/shiftkey/desktop/releases/download/release-${version}-linux1/GitHubDesktop-linux-${version}-linux1.AppImage";
    sha256 = "1z2w2j6lff74zi8ppwrppkdhl0av2h04bc4rqhy1h2c5xsjj6cgs";
  };
  appimageContents = appimageTools.extractType2 {
    inherit name src;
  };
in
appimageTools.wrapType2 {
  inherit src;
  name = pname;

  profile = ''
    export XDG_DATA_DIRS=${gsettings-desktop-schemas}/share/gsettings-schemas/${gsettings-desktop-schemas.name}:${gtk3}/share/gsettings-schemas/${gtk3.name}:$XDG_DATA_DIRS
  '';

  multiPkgs = null; # no 32bit needed

  extraPkgs = pkgs: with pkgs
    ; [
    curl
    git
    glib
    gnome2.GConf
    gnome3.gnome-keyring
    gnome3.libsecret
    nspr
    nss
    unzip
    xprintidle-ng
  ];

  extraInstallCommands = ''
    install -Dm644 ${appimageContents}/github-desktop.desktop $out/share/applications/github-desktop.desktop
    install -Dm644 ${appimageContents}/usr/share/icons/hicolor/1024x1024/apps/github-desktop.png $out/share/icons/hicolor/512x512/apps/github-desktop.png
    install -Dm644 ${appimageContents}/usr/share/icons/hicolor/512x512/apps/github-desktop.png $out/share/icons/hicolor/512x512/apps/github-desktop.png
    install -Dm644 ${appimageContents}/usr/share/icons/hicolor/256x256/apps/github-desktop.png $out/share/icons/hicolor/256x256/apps/github-desktop.png
    install -Dm644 ${appimageContents}/usr/share/icons/hicolor/128x128/apps/github-desktop.png $out/share/icons/hicolor/128x128/apps/github-desktop.png
    install -Dm644 ${appimageContents}/usr/share/icons/hicolor/64x64/apps/github-desktop.png $out/share/icons/hicolor/64x64/apps/github-desktop.png
    install -Dm644 ${appimageContents}/usr/share/icons/hicolor/32x32/apps/github-desktop.png $out/share/icons/hicolor/32x32/apps/github-desktop.png
  '';
}
