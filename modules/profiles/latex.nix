{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.kelszo.profiles.latex;
in
{
  options.kelszo.profiles.latex = {
    enable = mkEnableOption "latex profile";
  };

  config = mkIf cfg.enable {
    programs.texlive = {
      enable = true;
      extraPackages = tpkgs: { inherit (tpkgs) scheme-full; };
    };
  };
}
