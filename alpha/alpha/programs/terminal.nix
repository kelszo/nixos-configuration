{ pkgs, ... }: {
  home.file.".zsh/themes/kelszo.zsh-theme".source =
    ../dotfiles/kelszo.zsh-theme;

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    sessionVariables = { GOPATH = "$HOME/go"; };
    oh-my-zsh = {
      enable = true;
      theme = "kelszo";
      custom = "$HOME/.zsh/";
      plugins = [ "git" "docker" "sudo" ];
    };
  };

  home.file.".config/ranger/rc.conf".text = ''
    set preview_images true
    set preview_images_method ueberzug
  '';

  programs.git.enable = true;
}
