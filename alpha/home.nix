{ pkgs, config, ... }:
{
  nixpkgs.config = {
    packageOverrides = pkgs: {
      unstable = import (builtins.fetchTarball "https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz") {
        config = config.nixpkgs.config;
      };

      nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
        inherit pkgs;
      };
    };
  };

  nixpkgs.config.allowUnfree = true;

  imports =
    [ 
      ./programs/vscodium.nix
      ./programs/firefox
    ];
  
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" "docker"];
      theme = "spaceship";
      custom = "${pkgs.spaceship-prompt}/share/zsh";
    };
  };

  programs.git = {
    enable = true;
    userEmail = "kszolnoky+github@protonmail.com";
    userName = "Kelvin Szolnoky";
  };

  programs.rofi = {
    enable = true;
  };

  home.packages = with pkgs; [
    spaceship-prompt # oh-my-zsh theme

    # media
    vlc
    spotify
    xournalpp
    nomacs
    feh
    kdeApplications.okular
    spotify
    darktable

    bitwarden # password manager
    libreoffice # office suite
    redshift # Screen brightness and temperature
    thunderbird # email client

    # messaging
    slack
    signal-desktop
    discord


    # Spelling
    hunspell
    hunspellDicts.en-au-large
    hunspellDicts.sv-se

    # dev
    ## golang
    go

    ## javascript/typescript
    nodejs
    #nodePackages.depcheck
    nodePackages.npm-check-updates

    # kde packages
    # Password manager for KDE
    kdeFrameworks.kwallet
    kdeApplications.kwalletmanager
    kwalletcli

    # Allow automatic unlocking of kwallet if the same password. This seems to
    # work without installing kwallet-pam.
    kwallet-pam

    # ssh-add prompts a user for a passphrase using KDE. Not sure if it is used
    # by anything? ssh-add just asks passphrase on the console.
    ksshaskpass

    # GPG manager for KDE
    kgpg
    # This is needed for graphical dialogs used to enter GPG passphrases
    # pinentry-qt

    kdeplasma-addons

    # Screenshots
    kdeApplications.spectacle

    # Torrenting
    ktorrent

    # KDE apps
    kdeFrameworks.kconfig
    kdeFrameworks.kconfigwidgets
    dolphin
    kdeApplications.dolphin-plugins

    # tiling
    unstable.kwin-tiling
  ];
}