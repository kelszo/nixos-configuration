{ pkgs, ... }: {
  boot = {
    kernelPackages = pkgs.linuxPackages;

    loader = {
      efi = {
        canTouchEfiVariables = true;
      };

      systemd-boot = {
        enable = true;
      };

      # Skip the boot selection menu. In order to open it again, repeatedly press the space key on boot.
      timeout = 0;
    };

    tmpOnTmpfs = true;

    supportedFilesystems = [ "ntfs" ];
  };

  fileSystems."/".options = [ "noatime" "nodiratime" "discard" ];
}
