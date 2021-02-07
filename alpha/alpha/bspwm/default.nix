{ pkgs, ... }: {
  imports = [ ./dunst.nix ./rofi.nix ./sxhkd.nix ./randr.nix ];

  xsession = {
    enable = true;
    scriptPath = ".hm-xsession";
    windowManager.bspwm = {
      enable = true;
      extraConfig = ''
        set -U SXHKD_SHELL ${pkgs.zsh}/bin/zsh
        systemctl --user restart pulseaudio.service
        nohup $HOME/szobar &
        bspc config top_padding 30
        bspc config border_width 5
        bspc config window_gap 10
        bspc config split_ratio 0.5
        bspc config focused_border_color "#d4d4d4" 
        bspc config active_border_color "#d4d4d4"
        bspc config normal_border_color "#464646" 
        bspc config urgent_border_color "#CC0000" 
        bspc config focus_follows_pointer true
        bspc config pointer_follows_focus false
        bspc config normal_frame_opacity 1 
        bspc config focused_frame_opacity 1
        bspc config remove_disabled_monitors true
        bspc config remove_unplugged_monitors true
        bspc config merge_overlapping_monitors true

        bspc rule --add Firefox:\* state=floating
        bspc rule --add Firefox:Navigator state=tiled
        bspc rule --add Zathura state=tiled
      '';

      monitors = {
        eDP-1 = [ "I" "II" "III" "IV" "V" "VI" "VII" "VIII" "IX" "X" ];
      };

      rules = { "Firefox" = { state = "tiled"; }; };
    };
  };

  services.picom = {
    enable = true;
    vSync = false;
    shadow = false;
  };

  services.random-background = {
    enable = true;
    enableXinerama = false;
    imageDirectory = "%h/Pictures/wallpapers/current";
    interval = "1h";
  };

  services.redshift = {
    enable = true;
    brightness = {
      night = "0.5";
      day = "1";
    };

    temperature = {
      day = 5500;
      night = 3000;
    };

    latitude = "59.3293";
    longitude = "18.0686";
  };
}
