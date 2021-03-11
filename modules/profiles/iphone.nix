{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.kelszo.profiles.iphone;
in
{
  options.kelszo.profiles.iphone = {
    enable = mkEnableOption "iphone profile";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs;[
      ifuse # connect iphone
      libimobiledevice # connect iphone
      libheif # apple image format
    ];
  };
}
