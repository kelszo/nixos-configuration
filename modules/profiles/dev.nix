{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.kelszo.profiles.dev;
in
{
  options.kelszo.profiles.dev = {
    enable = mkEnableOption "dev profile";
  };

  config = mkIf cfg.enable {
    programs.vscode = {
      enable = true;
      package = pkgs.vscodium;
    };

    home.packages = with pkgs;[
      git
      insomnia # http-request client
      docker-compose
      gitAndTools.gh # github client
      robo3t # mongodb manager
      dbeaver # sql manager
      postgresql
      nodejs
      yarn
      nodePackages.npm-check-updates
      python39Full
    ];
  };
}
