{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.kelszo.profiles.fonts;
in
{
  options.kelszo.profiles.fonts = {
    enable = mkEnableOption "fonts profile";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs;
      let
        vcr = callPackage ../../packages/vcr.nix {};
        euclid = callPackage ../../packages/euclid.nix {};
        # slicer = callPackage ../../packages/slicer.nix { };
        san-francisco = callPackage ../../packages/san-francisco.nix {};
      in
        [
          #tamsyn
          terminus_font
          terminus_font_ttf
          vcr
          numix-icon-theme-circle
          san-francisco
        ];
  };
}
