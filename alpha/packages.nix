{ pkgs, ... }:
{

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
    killall
    libcap
    nethogs
    nix-index
    ntfs3g
    ping
    sudo
    tree
    unzip
    vbetool
    wget
    which
    zip
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
