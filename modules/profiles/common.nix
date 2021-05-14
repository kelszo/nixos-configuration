{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.kelszo.profiles.common;
in
{
  options.kelszo.profiles.common = {
    enable = mkEnableOption "common profile";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs;[
      # cli basics
      xclip # terminal clipboard manager
      unzip
      busybox

      # Spelling
      hunspell
      hunspellDicts.en-au-large
      hunspellDicts.sv-se

      # nixos
      nixfmt
      rnix-lsp

      youtube-dl
      nur.repos.rycee.firefox-addons-generator
    ];
  };
}
