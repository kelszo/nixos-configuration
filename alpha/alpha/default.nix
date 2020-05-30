{ pkgs, config, ... }:
let
  # nixos-master = import (builtins.fetchTarball
  #   "https://github.com/NixOS/nixpkgs/archive/master.tar.gz") {
  #     config = removeAttrs config.nixpkgs.config [ "packageOverrides" ];
  #   };

  nixos-unstable = import (builtins.fetchTarball
    "https://github.com/NixOS/nixpkgs-channels/archive/nixpkgs-unstable.tar.gz") {
      config = removeAttrs config.nixpkgs.config [ "packageOverrides" ];
    };

  nixos-nur = import (builtins.fetchTarball
    "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };

in {
  nixpkgs.config = {
    packageOverrides = pkgs: {
      unstable = nixos-unstable;

      nur = nixos-nur;

      # spotifyd = nixos-unstable.spotifyd.override { withMpris = true; };
    };
  };

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.pulseaudio = true;

  imports = [ ./programs ./packages.nix ./bspwm ];

  # NOTE: This is needed for enviroment variables to be set by Home Manager.
  programs.bash.enable = true;

  home.keyboard = { layout = "se"; };

  programs.git = {
    enable = true;
    userEmail = "kszolnoky+github@protonmail.com";
    userName = "Kelvin Szolnoky";
  };

  services.gnome-keyring = { enable = true; };

  # programs.password-store = { enable = true; };
}
