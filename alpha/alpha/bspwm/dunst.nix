{ pkgs, ... }: {
  services.dunst = {
    enable = true;
    settings = {
      global = {
        alignment = "left";
        allow_markup = true;
        browser = "${pkgs.firefox}-new-tab";
        font = "VCR OSD Mono 9";
        format = "%s: %b";
        geometry = "500x5+0+0";
        horizontal_padding = 10;
        ignore_newline = true;
        notification_height = 28;
        padding = 8;
        plain_text = false;
        separator_height = 0;
        show_indicators = false;
        shrink = true;
        sort = true;
        word_wrap = false;
        stack_duplicates = true;
      };

      fullscreen_delay_everything = { fullscreen = "delay"; };
      fullscreen_show_critical = {
        msg_urgency = "critical";
        fullscreen = "show";
      };

      urgency_low = {
        background = "#ffffff";
        foreground = "#464646";
        timeout = 0;
      };

      urgency_normal = {
        background = "#ffffff";
        foreground = "#464646";
        timeout = 0;
      };

      urgency_critical = {
        background = "#464646";
        foreground = "#ffffff";
        timeout = 0;
      };
    };
  };
}
