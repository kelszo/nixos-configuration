{ pkgs, ... }:

{
  # START --- boot
  boot.kernelParams = [ "intel_pstate=no_hwp" ];
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 0;

  boot.loader.grub.gfxmodeEfi = "1024x768";

  boot.initrd.luks.devices = [
    {
      name = "root";
      device = "/dev/disk/by-id/root";
      preLVM = true;
      allowDiscards = true;
    }
  ];

  fileSystems."/".options = [ "noatime" "nodiratime" "discard" ];
  # END --- boot

  # START --- kaby-lake cpu
  boot.kernelParams = [
    "i915.enable_fbc=1"
    "i915.enable_psr=2"
  ] ++ boot.kernelParams;

  boot.initrd.kernelModules = [ "i915" ];

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
  boot.kernelParams = [ "mem_sleep_default=deep" ] ++ boot.kernelParams;

  # touchpad goes over i2c
  boot.blacklistedKernelModules = [ "psmouse" ];

  services.throttled.enable = true;

  # This will save you money and possibly your life!
  services.thermald.enable = true;

  boot.kernelModules = [ "acpi_call" ];
  boot.extraModulePackages = with config.boot.kernelPackages; [ acpi_call ];
  # END --- laptop

  # START --- ssd
  boot.kernel.sysctl = {
    "vm.swappiness" = 1;
  };

  services.fstrim.enable = true;
  # END --- ssd
}