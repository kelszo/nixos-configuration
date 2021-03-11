{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.kelszo.profiles.photography;
in
{
  options.kelszo.profiles.photography = {
    enable = mkEnableOption "photography profile";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs;[
      # RAW-image processing
      darktable
      digikam
      shotwell
    ];
  };
}
