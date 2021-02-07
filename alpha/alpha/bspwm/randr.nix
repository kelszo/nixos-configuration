{ ... }: {
  programs.autorandr = {
    enable = true;
    profiles = {
      "laptop" = {
        fingerprint = {
          "eDP-1" =
            "00ffffffffffff004d10841400000000281b0104a51d11780ede50a3544c99260f505400000001010101010101010101010101010101ac3780a070383e403020350026a510000018892c80a070383e403020350026a510000018000000fe005754315233814c513133334d31000000000002410328001200000b010a20200001";
        };

        hooks = {
          preswitch = "killall szobar";
          postswitch = ''
            bspc monitor eDP-1 -d I II III IV V VI VII VIII IX X
            nohup $HOME/szobar &
            pactl set-card-profile 0 output:analog-stereo+input:analog-stereo
            systemctl --user restart random-background.service
          '';
        };

        config = {
          "eDP-1" = {
            enable = true;
            primary = true;
            crtc = 1;
            position = "0x0";
            mode = "1920x1080";
            gamma = "1.0:0.909:0.833";
            rate = "60.00";
            scale = {
              x = 1;
              y = 1;
            };
          };
        };
      };

      "home" = {
        fingerprint = {
          "eDP-1" =
            "00ffffffffffff004d10841400000000281b0104a51d11780ede50a3544c99260f505400000001010101010101010101010101010101ac3780a070383e403020350026a510000018892c80a070383e403020350026a510000018000000fe005754315233814c513133334d31000000000002410328001200000b010a20200001";
          "DP-2" =
            "00ffffffffffff0010acf4a04c5235300a1e0104b55825783eee95a3544c99260f5054a54b00714f81008180a940d1c00101010101014c9a00a0f0402e6030203a00706f3100001a000000ff00354b4330333033363035524c0a000000fc0044454c4c20553338313844570a000000fd001855197328000a20202020202001fd02031af14d9005040302071601141f12135a2309070783010000023a801871382d40582c4500706f3100001e565e00a0a0a0295030203500706f3100001acd4600a0a0381f4030203a00706f3100001a2d5080a070402e6030203a00706f3100001a134c00a0f040176030203a00706f3100001a000000000000000000000053";
        };

        hooks = {
          preswitch = "killall szobar";
          postswitch = ''
            bspc monitor DP-2 -d I II III IV V VI VII VIII IX X
            nohup $HOME/szobar &
            pactl set-card-profile 0 output:hdmi-stereo-extra1+input:analog-stereo
            systemctl --user restart random-background.service
          '';
        };

        config = {

          "eDP-1" = { enable = false; };

          "DP-2" = {
            enable = true;
            primary = true;
            crtc = 0;
            position = "0x0";
            mode = "3840x1600";
            gamma = "1.0:0.909:0.833";
            rate = "59.99";
          };
        };
      };
    };
  };
}
