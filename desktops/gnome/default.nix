{ pkgs, ... }: {
  services = {
    xserver = {
      enable = true;
      layout = "us";
      xkbVariant = "altgr-intl";
      xautolock.time = 120;
      displayManager = {
        gdm = {
          enable = true;
          wayland = true;
        };
      };

      desktopManager = {
        gnome3 = { enable = true; };
      };
    };

    dbus.packages = [ pkgs.gnome3.dconf ];
    udev.packages = [ pkgs.gnome3.gnome-settings-daemon ];
  };


  environment.gnome3.excludePackages = with pkgs.gnome3; [
    # baobab
    eog
    # epiphany # web-browser
    gedit
    gnome-font-viewer
    # pkgs.gnome-connections
    simple-scan
  ];

  security.pam.services.gdm.enableGnomeKeyring = true;
}
