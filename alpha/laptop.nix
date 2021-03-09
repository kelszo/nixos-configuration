{ pkgs, config, lib, ... }: {
  imports = [
    <nixos-hardware/dell/xps/13-9370>
  ];


  hardware = {
    cpu.intel.updateMicrocode = true;
    enableAllFirmware = true;
  };

  hardware.opengl.extraPackages = with pkgs; [
    vaapiIntel
    vaapiVdpau
    libvdpau-va-gl
  ];

  services.xserver.libinput = {
    enable = true;
    touchpad = {
      tapping = true;
      disableWhileTyping = true;
      scrollMethod = "twofinger";
      naturalScrolling = true;
    };
  };

  hardware.acpilight.enable = true;

  services = {
    tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      };
    };
    acpid.enable = true;
    upower.enable = true;
    dbus.enable = true;
    throttled.enable = true;
    thermald.enable = true;
    fstrim.enable = true;
    usbmuxd.enable = true;
  };

  powerManagement = {
    enable = true;
    powertop.enable = true;
  };


  boot = {
    extraModulePackages = with config.boot.kernelPackages; [ acpi_call ];
    kernel.sysctl = { "vm.swappiness" = 1; };
  };

}
