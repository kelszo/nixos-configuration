{ ... }: {
  home.file.".config/spotify-tui/config.yml".source =
    ../dotfiles/spot-tui.config.yml;

  services.spotifyd = {
    enable = true;
    settings = (import ../../secrets/spotifyd.nix { });
  };

}
