{ pkgs, ... }: {
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

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

      # Skip the boot selection menu. In order to open it again, repeatedly press the space key on boot.
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

    kernel.sysctl = { "vm.swappiness" = 1; };
  };

  fileSystems."/".options = [ "noatime" "nodiratime" "discard" ];
}
