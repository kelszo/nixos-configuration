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
    services.dropbox = { enable = true; path = "${config.home.homeDirectory}/Documents/Dropbox"; };

    home.packages = with pkgs;[
      libreoffice # office suite
      xournal # pdf-editor
      zettlr # knowledge-bank
      calibre # e-book management
      zotero # bibliographic manager
      pinta # image editor
    ];
  };
}
