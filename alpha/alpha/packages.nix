{ pkgs, ... }: {
  home.packages = with pkgs;
    let
      vcr = callPackage ../../packages/vcr.nix {};
      euclid = callPackage ../../packages/euclid.nix {};
      # slicer = callPackage ../../packages/slicer.nix { };
      san-francisco = callPackage ../../packages/san-francisco.nix {};
    in
      [
        # basics
        xclip # terminal clipboard manager
        unzip
        xdg-desktop-portal-gtk # chromium screen sharing

        # terminal
        ranger # file manager
        ueberzug

        # fonts
        #tamsyn
        terminus_font
        terminus_font_ttf
        vcr
        numix-icon-theme-circle
        san-francisco

        # media
        nomacs
        vlc
        spotify
        pinta # image editor
        xournal # pdf-editor
        arandr # screens
        deluge
        zettlr # knowledge-bank
        joplin-desktop # note taking
        calibre # e-book management
        audacity # voice recorder
        youtube-dl
        zotero # bibliographic manager
        # slicer # 3d slicer for mri
        protonmail-bridge
        ifuse # connect iphone
        libimobiledevice # connect iphone
        libheif # apple image format
        multimc
        teams

        # RAW-image processing
        darktable
        digikam
        shotwell

        # gnome
        gnome3.gnome-tweaks
        dconf2nix
        gnome3.dconf-editor
        # drive management
        gparted
        xfsprogs
        # extensions
        gnomeExtensions.window-is-ready-remover
        gnomeExtensions.sound-output-device-chooser
        gnomeExtensions.emoji-selector

        # screen recording/shotting
        peek
        simplescreenrecorder

        # other
        bitwarden # password manager
        libreoffice # office suite
        evolution # email and calendar client
        anki # flashcards

        # messaging
        discord
        slack
        element-desktop
        signal-desktop
        zoom-us

        # Spelling
        hunspell
        hunspellDicts.en-au-large
        hunspellDicts.sv-se

        # dev
        # awscli
        # awsebcli # elastic beanstalk
        insomnia # http-request client
        docker-compose
        gitAndTools.gh # github client

        ## building
        # gnumake
        # nodePackages.node-gyp
        # binutils-unwrapped
        # zlib

        # database
        robo3t # mongodb
        dbeaver # sql manager
        postgresql

        ## javascript/typescript
        nodejs
        yarn
        nodePackages.npm-check-updates

        ## python
        python39Full

        # nixos
        nur.repos.rycee.firefox-addons-generator
        nixfmt
        rnix-lsp
      ];
}
