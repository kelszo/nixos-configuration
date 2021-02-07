{ pkgs, ... }: {
  # network
  networking = {
    hostName = "alpha";
    enableIPv6 = false;

    firewall.enable = true;

    wireless = { iwd.enable = true; };

    # DNS over tls (see stubby)
    nameservers = [
      "127.0.0.1"
      #"0::1"
    ];

    # resolvconf = {
    #   #enable = false;
    #   useLocalResolver = true;
    # };

    dhcpcd.extraConfig = "nohook resolv.conf";

    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
      dhcp = "dhcpcd";
      dns = "none";
    };

    wireguard = {
      enable = true;
    };
    wg-quick = { interfaces = { wg0 = import ./secrets/integrity.nix; }; };
  };

  services.stubby = {
    enable = true;
    upstreamServers = ''
      - address_data: 95.216.212.177
        tls_auth_name: "dot-fi.blahdns.com"
      - address_data: 116.202.176.26
        tls_auth_name: "dot.libredns.gr"
    '';
  };

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
        load-module module-switch-on-connect
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
}
