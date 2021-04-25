{ pkgs, ... }: {
  home.packages = with pkgs;
    let
      slicer = callPackage ../../packages/slicer.nix {};
    in
      [
        # cli basics
        xclip # terminal clipboard manager
        unzip
        youtube-dl
        busybox

        # media
        nomacs
        vlc

        # games
        multimc

        # offics
        libreoffice # office suite
        xournal # pdf-editor
        zettlr # knowledge-bank
        joplin-desktop # note taking
        calibre # e-book management
        zotero # bibliographic manager
        pinta # image editor


        # screen recording/shotting
        peek
        simplescreenrecorder

        # other
        bitwarden # password manager
        evolution # email and calendar client
        anki # flashcards
        protonmail-bridge
        spotify
        deluge
        winetricks
        lutris


        # medicine
        slicer # 3d slicer for dicom

        # messaging
        discord
        slack
        element-desktop
        signal-desktop
        zoom-us
        teams

        # Spelling
        hunspell
        hunspellDicts.en-au-large
        hunspellDicts.sv-se

        # nixos
        nur.repos.rycee.firefox-addons-generator
        nixfmt
        rnix-lsp
      ];
}
