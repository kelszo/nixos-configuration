{ pkgs, ... }: {
  # network
  networking = {
    hostName = "alpha";
    enableIPv6 = true;

    firewall.enable = true;

    # DNS over tls (see stubby)
    # nameservers = [
    #   "127.0.0.1"
    #   "0::1"
    # ];

    nameservers = [
      "172.104.136.243"
      "195.10.195.195"
      "194.36.144.87"
      "192.71.245.208"
    ];

    # resolvconf = {
    #   enable = true;
    #   useLocalResolver = true;
    # };

    wireless.iwd.enable = true;

    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
    };

    wireguard = {
      enable = true;
    };

    wg-quick.interfaces.wg0 = import ./secrets/integrity.nix;
  };

  # services.stubby = {
  #   enable = true;
  #   upstreamServers = ''
  #     - address_data: 95.216.212.177
  #       tls_auth_name: "dot-fi.blahdns.com"
  #     - address_data: 116.202.176.26
  #       tls_auth_name: "dot.libredns.gr"
  #   '';
  # };

  sound = {
    enable = true;
    mediaKeys.enable = true;
  };

  hardware = {
    pulseaudio = {
      enable = true;
      support32Bit = true;
      package = pkgs.pulseaudioFull;
      # extraModules = [ pkgs.pulseaudio-modules-bt ];
      # zeroconf.discovery.enable = true;
      # extraConfig = ''
      #   load-module module-dbus-protocol
      #   load-module module-switch-on-connect
      # '';
    };

    # bluetooth = {
    #   enable = true;
    #   settings = { "General" = { "Enable" = "Source,Sink,Media,Socket"; }; };
    # };

    opengl = {
      enable = true;
      driSupport32Bit = true;
    };
  };

  services.pipewire = {
    enable = true;
  };
}
