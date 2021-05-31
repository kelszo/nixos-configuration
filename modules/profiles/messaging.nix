{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.kelszo.profiles.messaging;
in
{
  options.kelszo.profiles.messaging = {
    enable = mkEnableOption "messaging profile";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs;[
      element-desktop
      signal-desktop

      ferdi

      # DO NOT TRUST
      # TODO: sandbox
      discord
      slack
      zoom-us
      teams
    ];
  };
}
