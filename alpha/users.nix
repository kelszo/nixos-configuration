{ pkgs, ... }: {
  imports = [
    (
      import (
        builtins.fetchTarball {
          url = "https://github.com/rycee/home-manager/archive/master.tar.gz";
        }
      ) { inherit pkgs; }
    ).nixos
  ];
  security.sudo.enable = true;

  users.defaultUserShell = pkgs.zsh;
  environment.pathsToLink = [ "/libexec" "/share/zsh" ];

  # fix git asking for password
  programs.ssh.askPassword = "";

  # User programs
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

  fonts = {
    fontDir.enable = true;
    enableDefaultFonts = true;
    fonts = with pkgs;
      let
        san-francisco = callPackage ../packages/san-francisco.nix {};
      in
        [ san-francisco ];

    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "SF Mono" ];
        sansSerif = [ "SF Pro Text" ];
      };
    };
  };

  virtualisation = {
    docker = {
      enable = true;
      autoPrune.enable = true;
      # enableOnBoot = false;
    };
  };

  services.usbmuxd.enable = true;

  environment.gnome3.excludePackages = with pkgs.gnome3; [
    # baobab
    eog
    gedit
    gnome-font-viewer
    # pkgs.gnome-connections
    simple-scan
    gnome-terminal
  ];

  security.pam.services.gdm.enableGnomeKeyring = true;

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
