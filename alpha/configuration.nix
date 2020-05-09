{ config, pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.pulseaudio = true;

  imports = [
    ./hardware-configuration.nix
    ./xserver.nix
    ./users.nix
    ./laptop.nix
    ./hardware.nix
  ];

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.enableCryptodisk = true;
  boot.loader.grub.extraInitrd = "/boot/initrd.keys.gz";
  boot.loader.timeout = 0;

  boot.initrd.luks.devices = {
    root = {
      name = "root";
      device = "/dev/disk/by-uuid/2387d60a-ef56-423c-bd80-e277b1b660c7";
      preLVM = true;
      keyFile = "/keyfile.bin";
      allowDiscards = true;
    };
  };

  fileSystems."/".options = [ "noatime" "nodiratime" "discard" ];

  time.timeZone = "Europe/Stockholm";
  console.keyMap = "sv-latin1";
  i18n.defaultLocale = "en_AU.UTF-8";
  location.latitude = 59.3293;
  location.longitude = 18.0686;

  virtualisation.docker.enable = true;
  virtualisation.docker.autoPrune.enable = true;
  # virtualisation.docker.enableOnBoot = false;

  nix.gc.automatic = true;
  boot.tmpOnTmpfs = true;
  nix.optimise.automatic = true;
  nix.autoOptimiseStore = true;

  system.stateVersion = "19.09";
}
