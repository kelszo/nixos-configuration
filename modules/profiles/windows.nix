{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.kelszo.profiles.windows;
in
{
  options.kelszo.profiles.windows = {
    enable = mkEnableOption "windows profile";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs;[
      virt-manager
      freerdp
    ];
  };
}
