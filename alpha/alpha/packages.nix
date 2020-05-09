{ pkgs, ... }: {
  home.packages = with pkgs;
    let
      vcr = callPackage ../../packages/vcr.nix { };
      euclid = callPackage ../../packages/euclid.nix { };
    in [
      # basics
      xclip # terminal clipboard manager
      xorg.xbacklight # change brightness
      notify-desktop # send test notifications
      pulsemixer # terminal audio mixer
      iw
      unzip
      euclid # bspwm moving scripts
      killall
      pkg-config

      # terminal
      unstable.ranger # file manager
      unstable.ueberzug

      # fonts
      tamsyn
      terminus_font
      terminus_font_ttf
      vcr

      # media
      nomacs
      mpv
      unstable.spotify-tui
      spotify
      pinta # image editor

      # screen recording/shotting
      #obs-studio 
      peek
      simplescreenrecorder
      escrotum

      # other
      bitwarden # password manager
      libreoffice # office suite
      thunderbird # email client
      anki # flashcards
      brave # backup browser
      chromium

      # messaging
      discord
      slack
      unstable.gomuks
      unstable.qtox
      unstable.riot-desktop
      unstable.signal-desktop
      unstable.toxic
      unstable.zoom-us

      # Spelling
      hunspell
      hunspellDicts.en-au-large
      hunspellDicts.sv-se

      # dev
      insomnia # http-request client
      docker-compose
      kubectl

      # database
      robo3t # mongodb
      unstable.dbeaver # sql manager
      postgresql

      # golang
      unstable.go
      unstable.gotools
      packr

      ## javascript/typescript
      nodejs

      # nixos
      nur.repos.rycee.firefox-addons-generator
      nixfmt
      nodePackages.npm-check-updates
    ];
}
