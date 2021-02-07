{ pkgs, ... }: {
  services = {
    xserver = {
      enable = true;
      layout = "us";
      xkbVariant = "altgr-intl";
      xautolock.time = 120;
      displayManager = {
        #        defaultSession = "gnome";
        gdm = {
          enable = true;
          wayland = true;
        };
        #        autoLogin = {
        #          enable = true;
        #          user = "alpha";
        #        };
      };

      desktopManager = {
        gnome3 = { enable = true; };

        # BSPWM
        # session = [{
        #   name = "home-manager";
        #   start = ''
        #     ${pkgs.runtimeShell} $HOME/.hm-xsession &
        #     waitPID=$!
        #   '';
        # }];
      };
    };

    dbus.packages = [ pkgs.gnome3.dconf ];
    udev.packages = [ pkgs.gnome3.gnome-settings-daemon ];
  };
}
