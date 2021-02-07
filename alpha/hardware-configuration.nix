# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, ... }:

{
  imports = [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix> ];

  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "nvme"
    "usb_storage"
    "usbhid"
    "uas"
    "sd_mod"
    "rtsx_pci_sdmmc"
    "aesni_intel"
    "cryptd"
    "dm_crypt"
    "snd-seq"
    "snd-rawmidi"
  ];
  boot.initrd.kernelModules = [ "dm-snapshot" ];
  boot.kernelModules = [ "kvm-intel" "acpi_call" ];
  boot.extraModulePackages = [ pkgs.linuxPackages.v4l2loopback ];
  boot.blacklistedKernelModules = [ "psmouse" ];
  boot.kernelParams = [
    "i915.enable_fbc=1"
    "i915.enable_psr=2"
    "intel_pstate=no_hwp"
    "mem_sleep_default=deep"
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
    [{ device = "/dev/disk/by-uuid/beb0a8d9-4c1e-4062-8675-5412918bcc56"; }];

  nix.maxJobs = lib.mkDefault 8;
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}
