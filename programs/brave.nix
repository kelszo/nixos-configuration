{ pkgs, ... }: {
  programs.chromium = {
    enable = true;
    package = pkgs.brave;
    extensions = [
      { id = "nngceckbapebfimnlniiiahkandclblb"; } # bitwarden
      { id = "kiodaajmphnkcajieajajinghpejdjai"; } # Popup Blocker Pro
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # ublock origin
      { id = "edacconmaakjimmfgnblocblbcdcpbko"; } # session buddy
    ];
  };

  # screen sharing
  home.packages = with pkgs;[ xdg-desktop-portal-gtk ];
}
