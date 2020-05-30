{ pkgs, ... }: {
  # network
  networking.hostName = "alpha";
  networking.enableIPv6 = true;
  networking.nameservers = [
    "2001:9b1:8826::53"
    "2001:9b0:4:2601::53"
    "98.128.186.86"
    "155.4.89.136"
  ];

  services.connman = {
    enable = true;
    enableVPN = false;
    networkInterfaceBlacklist = [ "wg0" ];
    wifi.backend = "iwd";
    extraConfig = ''
      PreferredTechnologies=ethernet,wifi
    '';
  };

  networking.wireless = {
    enable = false;
    iwd = { enable = true; };
  };

  networking.firewall.enable = true;

  networking.wg-quick.interfaces = { wg0 = import ./secrets/integrity.nix; };

  # Sound
  sound.enable = true;
  sound.mediaKeys.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.support32Bit = true;
  hardware.pulseaudio.package = pkgs.pulseaudioFull;
  hardware.pulseaudio.extraModules = [ pkgs.pulseaudio-modules-bt ];
  hardware.pulseaudio.zeroconf.discovery.enable = true;
  hardware.pulseaudio.extraConfig = ''
    load-module module-dbus-protocol
  '';

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.extraConfig =
    "\n    [General]\n    Enable=Source,Sink,Media,Socket\n  ";
  services.blueman.enable = true;

  # Opengl
  hardware.opengl.enable = true;
  hardware.opengl.driSupport32Bit = true;
}
