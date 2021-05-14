{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.kelszo.profiles.gaming;
in
{
  options.kelszo.profiles.gaming = {
    enable = mkEnableOption "gaming profile";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs;[
      steam
      multimc
    ];
  };
}
