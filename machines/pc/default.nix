{ pkgs, ... }:

{
  nix.extraOptions = ''
    binary-caches-parallel-connections = 3
    connect-timeout = 5
  '';

  nixpkgs.config = {
    allowUnfree = true;
    pulseaudio = true;
  };

  imports = [
    ./hardware-configuration.nix
    ./boot.nix
    ../../desktops/gnome
    ../../users/alpha

    <nixos-hardware/common/cpu/intel>
    <nixos-hardware/common/gpu/nvidia.nix>
    <nixos-hardware/common/pc>
    <nixos-hardware/common/pc/ssd>
  ];

  # network
  networking = {
    hostName = "pc";
    enableIPv6 = true;

    firewall.enable = true;

    nameservers = [
      "172.104.136.243"
      "195.10.195.195"
      "194.36.144.87"
      "192.71.245.208"
    ];

    networkmanager = {
      enable = true;
    };

    wireguard = {
      enable = true;
    };

    #wg-quick.interfaces.wg0 = import ../../secrets/integrity.nix;
  };

  # sound
  sound = {
    enable = true;
    mediaKeys.enable = true;
  };

  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
    package = pkgs.pulseaudioFull;
  };

  services.pipewire = {
    enable = true;
  };

  # graphics
  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

  # cpu
  hardware = {
    cpu.intel.updateMicrocode = true;
    enableAllFirmware = true;
  };

  services = {
    fstrim.enable = true;
    dbus.enable = true;
    usbmuxd.enable = true;
  };

  security.doas = {
    enable = true;
    extraRules = [
      {
        users = [ "alpha" ];
        keepEnv = true;
        persist = true;
      }
    ];
  };

  users.defaultUserShell = pkgs.zsh;
  environment.pathsToLink = [ "/libexec" "/share/zsh" ];

  # fix git asking for password
  programs.ssh.askPassword = "";

  # User programs
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [ "git" "docker" ];
    };
  };

  fonts = {
    fontDir.enable = true;
    enableDefaultFonts = true;
    fonts = with pkgs;
      let
        san-francisco = callPackage ../../packages/san-francisco.nix {};
      in
        [ san-francisco ];

    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "SF Mono" ];
        sansSerif = [ "SF Pro Text" ];
      };
    };
  };

  virtualisation = {
    docker = {
      enable = true;
      autoPrune.enable = true;
      enableOnBoot = false;
    };
  };

  # internalisation
  time.timeZone = "Europe/Stockholm";
  console.keyMap = "sv-latin1";
  i18n.defaultLocale = "en_AU.UTF-8";
  location = {
    latitude = 59.3293;
    longitude = 18.0686;
  };

  # fix systemd stop timer being too long
  systemd.extraConfig = ''
    DefaultTimeoutStopSec=10s
  '';

  nix = {
    optimise.automatic = true;
    autoOptimiseStore = true;
    gc.automatic = false;
  };

  system.autoUpgrade = {
    enable = true;
    allowReboot = false;
    channel = "https://nixos.org/channels/nixos-unstable";
  };

  # Do not change
  system.stateVersion = "20.09";
}
