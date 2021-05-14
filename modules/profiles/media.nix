{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.kelszo.profiles.media;
in
{
  options.kelszo.profiles.media = {
    enable = mkEnableOption "media profile";
  };


  config = mkIf cfg.enable {
    programs.mpv.enable = true;

    home.packages = with pkgs;[
      nomacs
      gnome-mpv

      deluge

      # screen recording/shotting
      peek
      simplescreenrecorder

      # DO NOT TRUST
      # TODO: sandbox
      spotify
    ];
  };
}
