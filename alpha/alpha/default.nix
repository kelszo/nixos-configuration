{ pkgs, config, ... }:
let
  nixos-nur = import (
    builtins.fetchTarball
      "https://github.com/nix-community/NUR/archive/master.tar.gz"
  ) {
    inherit pkgs;
  };
in
{
  programs.home-manager.enable = true;

  nixpkgs.config = {
    allowUnfree = true;
    pulseaudio = true;
    packageOverrides = pkgs: { nur = nixos-nur; };
  };

  nixpkgs.overlays = [
    (
      self: super: {
        discord = super.discord.overrideAttrs (
          _: {
            src = builtins.fetchTarball
              "https://discord.com/api/download?platform=linux&format=tar.gz";
          }
        );
      }
    )
  ];

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
  };

  imports = [ ./programs ./packages.nix ./gnome ];

  # NOTE: This is needed for enviroment variables to be set by Home Manager.
  programs.bash.enable = true;

  home = {
    username = "alpha";
    homeDirectory = "/home/alpha";
    stateVersion = "19.09";

    keyboard = {
      layout = "us";
      variant = "altgr-intl";
    };
  };
}
