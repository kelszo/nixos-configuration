{ pkgs, ... }: {
  programs.rofi = {
    enable = true;
    fullscreen = false;
    lines = 5;
    location = "top";
    scrollbar = false;
    terminal = "${pkgs.alacritty}/bin/alacritty";
    width = 20;
    padding = 20;
    rowHeight = 1;
    yoffset = 40;
    font = "VCR OSD Mono 11";

    colors = {
      window = {
        background = "#ffffff";
        border = "#dfdfdf";
        separator = "#dfdfdf";
      };

      rows = {
        normal = {
          background = "#ffffff";
          foreground = "#464646";
          backgroundAlt = "#c2c2c2";
          highlight = {
            background = "#464646";
            foreground = "#f0f0f0";
          };
        };

        active = {
          background = "#ffffff";
          foreground = "#464646";
          backgroundAlt = "#f0f0f0";
          highlight = {
            background = "#464646";
            foreground = "#f0f0f0";
          };
        };
      };
    };
  };

}
