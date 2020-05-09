{ pkgs, config, ... }: {
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
    disableWhileTyping = true;
    scrollMethod = "twofinger";
    naturalScrolling = true;
  };

  hardware.acpilight.enable = true;
  programs.light.enable = true;

  services.tlp.enable = true;
  services.acpid.enable = true;
  services.upower.enable = true;
  services.dbus.enable = true;
  powerManagement.enable = true;
  #powerManagement.cpuFreqGovernor = "ondemand";

  services.throttled.enable = true;

  services.thermald.enable = true;

  boot.extraModulePackages = with config.boot.kernelPackages; [ acpi_call ];
  # END --- laptop

  # START --- ssd
  boot.kernel.sysctl = { "vm.swappiness" = 1; };

  services.fstrim.enable = true;
  # END --- ssd
}
