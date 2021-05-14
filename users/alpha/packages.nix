{ pkgs, ... }: {
  home.packages = with pkgs;
    let
      slicer = callPackage ../../packages/slicer.nix {};
    in
      [
        # other
        bitwarden # password manager
        evolution # email and calendar client
        anki # flashcards
        protonmail-bridge
        winetricks
        lutris

        # medicine
        slicer # 3d slicer for dicom
      ];
}
