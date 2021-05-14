# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "nvme"
    "usbhid"
    "usb_storage"
    "sd_mod"
    "rtsx_pci_sdmmc"

    "uas"
    "aesni_intel"
    "cryptd"
    "dm_crypt"
    "snd-seq"
    "snd-rawmidi"
  ];
  boot.initrd.kernelModules = [ "dm-snapshot" ];
  boot.kernelModules = [ "kvm-intel" "acpi_call" ];
  boot.extraModulePackages = [ config.boot.kernelPackages.v4l2loopback config.boot.kernelPackages.acpi_call ];
  boot.kernelParams = [
    "intel_pstate=no_hwp"
    "nvme_core.default_ps_max_latency_us=6000"
    "intel_idle.max_cstate=1"
  ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/c334dcc1-5ee6-4269-85bb-e002ee1e7ffc";
    fsType = "ext4";
  };

  fileSystems."/boot/efi" = {
    device = "/dev/disk/by-uuid/2862-0003";
    fsType = "vfat";
  };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/beb0a8d9-4c1e-4062-8675-5412918bcc56"; } ];
}
