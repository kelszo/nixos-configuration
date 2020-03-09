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
      ./programs/vscodium
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

  # START --- kde dotfiles
  home.file.".config/kwinrc".source = dotfiles/kwinrc;
  home.file.".config/kdeglobals".source = dotfiles/kdeglobals;
  home.file.".config/khotkeysrc".source = dotfiles/khotkeysrc;
  home.file.".config/kglobalshortcutsrc".source = dotfiles/kglobalshortcutsrc;
  # END --- kde dotfiles

  home.file.".config/kitty/kitty.conf".source = dotfiles/kitty;

  home.packages = with pkgs; [
    spaceship-prompt # oh-my-zsh theme

    # media
    vlc
    spotify
    xournalpp
    nomacs
    kdeApplications.okular
    spotify
    # darktable

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
    kitty # terminal
    ## golang
    go

    ## javascript/typescript
    nodejs
    #nodePackages.depcheck
    nodePackages.npm-check-updates

    # kde packages
    unstable.kwin-tiling # tiling
    plasma-browser-integration
  ] ++ builtins.filter stdenv.lib.isDerivation (builtins.attrValues kdeApplications)
    ++ builtins.filter stdenv.lib.isDerivation (builtins.attrValues plasma5)
    ++ builtins.filter stdenv.lib.isDerivation (builtins.attrValues kdeFrameworks);
}
