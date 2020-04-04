{ config, pkgs, ... }: {
  nixpkgs.config = {
    packageOverrides = pkgs: {
      unstable = import (builtins.fetchTarball
        "https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz") {
          config = config.nixpkgs.config;
        };

      nur = import (builtins.fetchTarball
        "https://github.com/nix-community/NUR/archive/master.tar.gz") {
          inherit pkgs;
        };
    };
  };

  nixpkgs.config.allowUnfree = true;

  imports = [ # Include the results of the hardware scan.
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
  networking.networkmanager.wifi.powersave = false;

  # https://servers.opennic.org/ & https://dns.watch/ & https://blahdns.com/
  networking.networkmanager.insertNameservers =
    [ "208.67.222.222" "208.67.222.220" ];
  networking.firewall.enable = true;

  # networking.networkmanager.unmanaged = ["interface-name:wg*"];
  # networking.wireguard.enable = true;
  # networking.wg-quick.interfaces = {
  #   wg0 = {
  #     address = [ "10.0.137.136/24" "fdab:1337:1337:137::136/64" ];
  #     privateKeyFile = "/etc/nixos/wgPrivateKey";
  #     dns = ["2001:9b1:8826::53" "2001:9b0:4:2601::53" "98.128.186.86" "155.4.89.136"];

  #     peers = [
  #       {
  #         publicKey = "ipW9/ysMc9vQbg/x7WK/udnl06+NJioWZZ4XIqz4PQY=";
  #         allowedIPs = [ "0.0.0.0/0" "::/0"];
  #         endpoint = "wireguard.5july.net:48574";
  #         persistentKeepalive = 25;
  #       }
  #     ];
  #   };
  # };
  # END --- networking

  # START --- hardware
  # Sound
  sound.enable = true;
  sound.mediaKeys.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.support32Bit = true;
  hardware.pulseaudio.package = pkgs.pulseaudioFull;
  hardware.pulseaudio.extraModules = [ pkgs.pulseaudio-modules-bt ];
  hardware.pulseaudio.zeroconf.discovery.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.extraConfig =
    "\n    [General]\n    Enable=Source,Sink,Media,Socket\n  ";
  services.blueman.enable = true;

  # Opengl
  hardware.opengl.enable = true;
  hardware.opengl.driSupport32Bit = true;
  # END --- hardware

  # START --- internalisation
  time.timeZone = "Europe/Stockholm";
  i18n.consoleKeyMap = "sv-latin1";
  i18n.defaultLocale = "en_AU.UTF-8";
  location.latitude = 59.3293;
  location.longitude = 18.0686;
  # END --- internalisation

  # START --- docker
  virtualisation.docker.enable = true;
  virtualisation.docker.autoPrune.enable = true;
  # virtualisation.docker.enableOnBoot = false;
  # END --- docker

  nix.gc.automatic = true;
  boot.tmpOnTmpfs = true;
  # nix.optimise.automatic = true;
  # nix.autoOptimiseStore = true;

  system.stateVersion = "19.09";
}
