{ ... }: {
  services.sxhkd = {
    enable = true;
    keybindings = {
      # bspwm
      "super + Return" = "nohup alacritty&";
      "super + d" = "nohup rofi -combi-modi window,drun -show combi&";
      "super + q" = "bspc node -c";
      "super + {_,shift + }{1-9,0}" = "bspc {desktop -f,node -d} '^{1-9,10}'";
      "super + {Left,Down,Up,Right}" = "bspc node -f {west,south,north,east}";
      "super + shift + {Left,Down,Up,Right}" =
        "euclid_mover {west,south,north,east}";
      "alt + b" = "euclid_balancer";
      "super + {_,shift + }f" = "bspc node -t {\\~fullscreen,floating}";
      "super + t" = "bspc node -t tiled";
      "super + p" = "bspc desktop --focus last.local";
      "super + shift + {1-9,0}" = "bspc node --to-desktop ^{1-9,10}";

      # screenshot
      "Print" = "escrotum -s -C";

      # media keys
      "XF86Audio{Raise,Lower}Volume" = "pactl set-sink-volume 0 {+,-}5%";
      "XF86AudioMute" = "pactl set-sink-mute 0 toggle";

      "XF86MonBrightnessUp" = "light -A 5";
      "XF86MonBrightnessDown" = "light -U 5";
    };
  };
}
