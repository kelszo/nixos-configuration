{ pkgs, ... }: {
  home.file.".zsh/themes/kelszo.zsh-theme".source =
    ../dotfiles/kelszo.zsh-theme;

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    shellAliases = {
      "du-mongossh" =
        "ssh -fN -L 6666:localhost:27017 digitalungdom@digitalungdom.se";
      "kelszo-psqlssh" = "ssh -fN -L 6666:localhost:5432 kelszo.com";
      "kelszo-mongossh" = "ssh -fN -L 6666:localhost:27017 kelszo.com";
    };
    sessionVariables = { GOPATH = "$HOME/go"; };
    oh-my-zsh = {
      enable = true;
      theme = "kelszo";
      custom = "$HOME/.zsh/";
      plugins = [ "git" "docker" "sudo" ];
    };
  };

  programs.alacritty = {
    enable = true;
    settings = {
      shell = "${pkgs.zsh}/bin/zsh";

      window = {
        padding = {
          x = 35;
          y = 35;
        };
      };

      cursor = { style = "Block"; };

      colors = {
        primary = {
          background = "#ffffff";
          foreground = "#464646";
        };
      };

      font = {
        size = 7;
        normal = { family = "Terminus"; };
        bold = {
          family = "Terminus";
          style = "Bold";
        };
        italic = {
          family = "Terminus";
          style = "Italic";
        };
      };
    };
  };

  home.file.".config/ranger/rc.conf".text = ''
    set preview_images true
    set preview_images_method ueberzug
  '';
}
