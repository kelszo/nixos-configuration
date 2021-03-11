{ ... }: {
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
}
