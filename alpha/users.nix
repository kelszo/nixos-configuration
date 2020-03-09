{ pkgs, ... }:

{
  imports = [
    (import (builtins.fetchTarball {
    url = "https://github.com/rycee/home-manager/archive/release-19.09.tar.gz";
    }) { inherit pkgs; }).nixos
  ];
  security.sudo.enable = true;

  users.defaultUserShell = pkgs.zsh;

  users.users.alpha = {
    isNormalUser = true;
    home = "/home/alpha";
    description = "alpha";
    extraGroups = [ "wheel" "networkmanager" ];
  };

  home-manager.users.alpha = import ./home.nix;
}