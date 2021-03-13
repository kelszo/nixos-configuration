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

  imports = [
    ../../modules/profiles
    ./packages.nix
    ../../desktops/gnome/home.nix
    ../../programs/firefox
    ../../programs/brave.nix
    ../../programs/zsh.nix
  ];

  kelszo.profiles = {
    photography.enable = true;
    dev.enable = true;
    iphone.enable = true;
    fonts.enable = true;
    latex.enable = true;
  };

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

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs;
      let
        obs-droidcam = callPackage ../../../packages/obs-droidcam.nix {};
      in
        [ obs-v4l2sink obs-droidcam ];
  };
}
