{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.kelszo.profiles.office;
in
{
  options.kelszo.profiles.office = {
    enable = mkEnableOption "office profile";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs;[
      libreoffice # office suite
      xournal # pdf-editor
      zettlr # knowledge-bank
      joplin-desktop # note taking
      calibre # e-book management
      zotero # bibliographic manager
      pinta # image editor
    ];
  };
}
