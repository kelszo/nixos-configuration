{ pkgs, ... }:
with pkgs;
let
  my-python-packages = python-packages:
    with python-packages; [
      dbus
      dbus-python
      distro
    ];
  python-with-my-packages = python3.withPackages my-python-packages;
in {

  environment.systemPackages = with pkgs; [
    # Basic command line tools
    acpi
    bash
    binutils
    cmake
    coreutils
    curl
    dnsutils
    file
    gcc
    git
    gksu
    gnumake
    hdf5
    htop
    imagemagick
    killall
    libcap
    libheif
    nethogs
    nix-index
    ntfs3g
    patchelf
    ping
    qt5.full
    sudo
    tree
    unzip
    vbetool
    wget
    which
    wine
    wireguard
    zip

    # python
    python-with-my-packages
  ];

  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts
    dina-font
    proggyfonts
  ];
}
