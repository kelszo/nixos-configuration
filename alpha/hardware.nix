{ pkgs, ... }: {
  # network
  networking = {
    hostName = "alpha";
    enableIPv6 = false;

    firewall.enable = true;

    wireless = { enable = false; };

    # nameservers =
    #   [ "91.239.100.100" "2001:67c:28a4::" "89.233.43.71" "2a01:3a0:53:53::" ];

    nameservers =
      [ "176.126.70.119" "91.217.137.37" "176.9.37.132" "195.10.195.195" ];

    resolvconf = {
      enable = true;
      dnsSingleRequest = true;
    };

    networkmanager = {
      enable = true;
      wifi.backend = "wpa_supplicant";
      dhcp = "dhclient";
    };

    wireguard = {
      enable = true;
      #interfaces = { wg0 = import ./secrets/integrity-wireguard.nix; };
    };

    wg-quick = { interfaces = { wg0 = import ./secrets/integrity.nix; }; };

  };

  # Sound
  sound = {
    enable = true;
    mediaKeys.enable = true;
  };

  hardware = {
    pulseaudio = {
      enable = true;
      support32Bit = true;
      package = pkgs.pulseaudioFull;
      extraModules = [ pkgs.pulseaudio-modules-bt ];
      zeroconf.discovery.enable = true;
      extraConfig = ''
        load-module module-dbus-protocol
      '';
    };

    bluetooth = {
      enable = true;
      config = { "General" = { "Enable" = "Source,Sink,Media,Socket"; }; };
    };

    opengl = {
      enable = true;
      driSupport32Bit = true;
    };
  };

  services.pipewire = {
    enable = true;
  };

  services.blueman.enable = true;

  # Opengl

}
