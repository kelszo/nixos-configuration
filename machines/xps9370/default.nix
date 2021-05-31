{ lib, pkgs, ... }:

{
  nixpkgs.config = {
    allowUnfree = true;
    pulseaudio = true;
  };

  imports = [
    ./hardware-configuration.nix
    ./boot.nix
    ../../desktops/gnome
    ../../users/alpha

    <nixos-hardware/dell/xps/13-9370>
  ];

  home-manager.users.alpha.kelszo.profiles = {
    common.enable = true;
    dev.enable = true;
    fonts.enable = true;
    iphone.enable = true;
    latex.enable = true;
    media.enable = true;
    messaging.enable = true;
    office.enable = true;
    photography.enable = true;
    windows.enable = true;
  };

  # network
  networking = {
    hostName = "xps";
    enableIPv6 = true;

    firewall.enable = true;

    nameservers = [
      "172.104.136.243"
      "195.10.195.195"
      "194.36.144.87"
      "192.71.245.208"
    ];

    wireless.iwd.enable = true;

    networkmanager = {
      enable = true;
    };

    wireguard = {
      enable = true;
    };

    wg-quick.interfaces.wg0 = import ../../secrets/integrity.nix;
  };

  # sound
  sound = {
    enable = true;
    mediaKeys.enable = true;
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

  # bluetooth
  hardware = {
    bluetooth = {
      enable = true;
      settings = { "General" = { "Enable" = "Source,Sink,Media,Socket"; }; };
    };

    pulseaudio = {
      enable = true;
      package = pkgs.pulseaudioFull;
      support32Bit = true;
      extraModules = [ pkgs.pulseaudio-modules-bt ];
      zeroconf.discovery.enable = true;
      extraConfig = ''
        load-module module-dbus-protocol
        load-module module-switch-on-connect
      '';
    };
  };

  # laptop
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

  # power saving
  services = {
    tlp = {
      enable = lib.mkForce false;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      };
    };
    acpid.enable = true;
    upower.enable = true;
    throttled.enable = true;
    thermald.enable = true;
  };

  powerManagement = {
    enable = true;
    powertop.enable = true;
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
    podman = {
      enable = true;
      dockerCompat = true;
    };

    libvirtd = {
      enable = true;
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
    optimise = { automatic = true; dates = [ "weekly" ]; };
    autoOptimiseStore = true;
    gc = { automatic = true; dates = "weekly"; options = "-d --delete-older-than 7d"; };
    extraOptions = ''
      min-free = ${toString (1024 * 1024 * 1024 * 16)}
    '';
  };

  system.autoUpgrade = {
    enable = true;
    allowReboot = false;
    channel = "https://nixos.org/channels/nixos-unstable";
  };

  # Do not change
  system.stateVersion = "19.09";
}
