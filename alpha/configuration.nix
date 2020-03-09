{ config, pkgs, ... }:
{
  nixpkgs.config = {
    packageOverrides = pkgs: {
      unstable = import (builtins.fetchTarball "https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz") {
        config = config.nixpkgs.config;
      };

      nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
        inherit pkgs;
      };
    };
  };

  nixpkgs.config.allowUnfree = true;

  imports =
    [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./kde.nix
    ./packages.nix
    ./users.nix
    ./laptop.nix
    ];

  # START --- networking
  networking.hostName = "alpha";
  networking.enableIPv6 = true;
  networking.networkmanager.enable = true;

  networking.nameservers = [ "95.216.212.177" "2a01:4f9:c010:43ce::1" ];

  networking.firewall.enable = true;
  # END --- networking

  # START --- hardware
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.bluetooth.enable = true;
  hardware.opengl.enable = true;
  # END --- hardware

  # START --- internalisation
  time.timeZone = "Europe/Stockholm";
  i18n.consoleKeyMap = "sv-latin1";
  i18n.defaultLocale = "en_AU.UTF-8";
  location.latitude = 59.3293;
  location.longitude = 18.0686;
  # END --- internalisation

  nix.gc.automatic = true;
  nix.optimise.automatic = true;
  nix.autoOptimiseStore = true;

  system.stateVersion = "19.09";
}
