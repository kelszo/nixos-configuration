{ pkgs, config, ... }: {
  # START --- boot
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.enableCryptodisk = true;
  boot.loader.grub.extraInitrd = "/boot/initrd.keys.gz";
  boot.loader.timeout = 0;

  boot.initrd.luks.devices = [{
    name = "root";
    device = "/dev/disk/by-uuid/2387d60a-ef56-423c-bd80-e277b1b660c7";
    preLVM = true;
    keyFile = "/keyfile.bin";
    allowDiscards = true;
  }];

  fileSystems."/".options = [ "noatime" "nodiratime" "discard" ];
  # END --- boot

  # START --- kaby-lake cpu
  hardware.cpu.intel.updateMicrocode = true;
  hardware.enableAllFirmware = true;

  hardware.opengl.extraPackages = with pkgs; [
    vaapiIntel
    vaapiVdpau
    libvdpau-va-gl
  ];
  # END --- kaby-lake cpu

  # START --- laptop
  services.xserver.libinput = {
    enable = true;
    tapping = true;
    disableWhileTyping = false;
    scrollMethod = "twofinger";
    naturalScrolling = true;
  };

  services.tlp.enable = true;
  services.acpid.enable = true;
  services.upower.enable = true;
  services.dbus.enable = true;
  powerManagement.enable = true;
  powerManagement.cpuFreqGovernor = null;

  # Force S3 sleep mode. See README.wiki for details.
  # boot.kernelParams = [ "mem_sleep_default=deep" ];

  services.throttled.enable = true;

  services.thermald.enable = true;

  boot.extraModulePackages = with config.boot.kernelPackages; [ acpi_call ];
  # END --- laptop

  # START --- ssd
  boot.kernel.sysctl = { "vm.swappiness" = 1; };

  services.fstrim.enable = true;
  # END --- ssd
}
