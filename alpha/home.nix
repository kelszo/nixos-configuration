{ pkgs, config, ... }: {
  nixpkgs.config = {
    packageOverrides = pkgs: {
      unstable = import (builtins.fetchTarball
        "https://github.com/NixOS/nixpkgs-channels/archive/nixpkgs-unstable.tar.gz") {
          config = config.nixpkgs.config;
        };

      nur = import (builtins.fetchTarball
        "https://github.com/nix-community/NUR/archive/master.tar.gz") {
          inherit pkgs;
        };
    };
  };

  nixpkgs.config.allowUnfree = true;

  imports = [ ./programs/vscodium ./programs/firefox ];

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    shellAliases = {
      "chmodpro" =
        "find . -type d -exec chmod 775 {} ; && find . -type f -exec chmod 644 {} ;";
      "mongossh" =
        "ssh -fN -L 6666:localhost:27017 digitalungdom@digitalungdom.se";
      "psqlssh" = "ssh -fN -L 6666:localhost:5432 kelszo.com";
    };
    sessionVariables = { GOPATH = "$HOME/go"; };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" "docker" ];
      theme = "spaceship";
      custom = "${pkgs.spaceship-prompt}/share/zsh";
    };
  };

  programs.git = {
    enable = true;
    userEmail = "kszolnoky+github@protonmail.com";
    userName = "Kelvin Szolnoky";
  };

  # programs.texlive = {
  #   enable = true;
  # };

  home.file.".config/kitty/kitty.conf".source = dotfiles/kitty;

  # programs.kitty = {
  #   enable = true;
  #   font = "monospace";
  #   settings = {
  #     "font_size" = 12.0;
  #     "window_padding_width" = 35.0;
  #     "enable_audio_bell" = false;

  #     "foreground" =  "#707070";
  #     "background" =  "#f3f3f3";
  #     "cursorColor"=  "#707070";
  #     "color0" = "#d3d3d3";
  #     "color8" = "#b3b3b3";
  #     "color1" = "#ef6b7b";
  #     "color9" = "#ed5466";
  #     "color2" = "#a1d569";
  #     "color10" = "#afdb80";
  #     "color3" = "#f59335";
  #     "color11" = "#f59335";
  #     "color4" = "#4ec2e8";
  #     "color12" = "#5dc7ea";
  #     "color5" = "#fec7cd";
  #     "color13" = "#d2a4b4";
  #     "color6" = "#95c1c0";
  #     "color14" = "#75a1a0";
  #     "color7" = "#707070";
  #     "color15" = "#464646";
  #   };
  # };

  # START --- kde dotfiles
  home.file.".config/kwinrc".source = dotfiles/kwinrc;
  home.file.".config/kdeglobals".source = dotfiles/kdeglobals;
  home.file.".config/khotkeysrc".source = dotfiles/khotkeysrc;
  home.file.".config/kglobalshortcutsrc".source = dotfiles/kglobalshortcutsrc;
  # END --- kde dotfiles

  home.packages = with pkgs;
    [
      spaceship-prompt # oh-my-zsh theme

      # media
      vlc
      spotify
      xournalpp
      nomacs
      kdeApplications.okular
      spotify
      obs-studio # screen recording
      speedcrunch # calculator
      ktorrent
      ffmpeg-full
      #darktable

      bitwarden # password manager
      libreoffice # office suite
      redshift # Screen brightness and temperature
      thunderbird # email client
      anki # flashcards
      chromium # backup browser
      docker-compose
      cloc # count lines of code
      steam
      lutris # game emulation
      unstable.minecraft
      nextcloud-client

      # database
      robo3t # mongodb
      unstable.dbeaver # sql manager
      postgresql

      # messaging
      slack
      signal-desktop
      discord
      zoom-us
      riot-desktop

      # Spelling
      hunspell
      hunspellDicts.en-au-large
      hunspellDicts.sv-se

      # dev
      clang-tools
      insomnia # http-request client
      kitty # terminal
      electron

      ## golang
      unstable.go
      unstable.gotools

      ## rust
      rustup

      ## latex
      texlive.combined.scheme-full

      ## javascript/typescript
      nodejs
      #nodePackages.depcheck
      nodePackages.npm-check-updates

      # kde packages
      unstable.kwin-tiling # tiling
      plasma-browser-integration

      # nixos
      nur.repos.rycee.firefox-addons-generator
      nixfmt
    ] ++ builtins.filter stdenv.lib.isDerivation
    (builtins.attrValues kdeApplications)
    ++ builtins.filter stdenv.lib.isDerivation (builtins.attrValues plasma5)
    ++ builtins.filter stdenv.lib.isDerivation
    (builtins.attrValues kdeFrameworks);
}
