{ config, pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
    pulseaudio = true;
  };

  imports = [
    ./hardware-configuration.nix
    ./xserver.nix
    ./users.nix
    ./laptop.nix
    ./hardware.nix
  ];

  boot = {
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };

      grub = {
        enable = true;
        version = 2;
        device = "nodev";
        efiSupport = true;
        enableCryptodisk = true;
      };

      timeout = 0;
    };

    initrd = {
      secrets = { "keyfile.bin" = "/etc/secrets/initrd/keyfile.bin"; };
      luks.devices = {
        root = {
          name = "root";
          device = "/dev/disk/by-uuid/2387d60a-ef56-423c-bd80-e277b1b660c7";
          preLVM = true;
          keyFile = "/keyfile.bin";
          allowDiscards = true;
          fallbackToPassword = true;
        };
      };
    };

    tmpOnTmpfs = true;

    supportedFilesystems = [ "ntfs" ];
  };

  fileSystems."/".options = [ "noatime" "nodiratime" "discard" ];

  time.timeZone = "Europe/Stockholm";
  console.keyMap = "sv-latin1";
  i18n.defaultLocale = "en_AU.UTF-8";
  location = {
    latitude = 59.3293;
    longitude = 18.0686;
  };

  nix = {
    optimise.automatic = true;
    autoOptimiseStore = true;
    gc.automatic = true;
  };

  system.autoUpgrade = {
    enable = true;
    allowReboot = true;
    channel = "https://nixos.org/channels/nixos-unstable";
  };

  system.stateVersion = "19.09";
}
