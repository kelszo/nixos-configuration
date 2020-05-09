{ pkgs, ... }: {
  imports = [
    (import (builtins.fetchTarball {
      url =
        "https://github.com/rycee/home-manager/archive/release-20.03.tar.gz";
    }) { inherit pkgs; }).nixos
  ];
  security.sudo.enable = true;

  users.defaultUserShell = pkgs.zsh;
  environment.pathsToLink = [ "/libexec" "/share/zsh" ];

  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [ "git" "docker" "sudo" ];
    };
  };

  users.users.alpha = {
    isNormalUser = true;
    home = "/home/alpha";
    description = "alpha";
    shell = pkgs.zsh;
    extraGroups =
      [ "wheel" "networkmanager" "docker" "sound" "video" "pulse" "audio" ];
  };

  home-manager.users.alpha = import ./alpha;
}
