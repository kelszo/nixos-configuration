{ pkgs, ... }: {
  imports = [ ./vscodium ./firefox ./terminal.nix ];

  programs.chromium = {
    enable = true;
    package = pkgs.ungoogled-chromium;
    extensions = [
      "nngceckbapebfimnlniiiahkandclblb" # bitwarden
      "kiodaajmphnkcajieajajinghpejdjai" # Popup Blocker Pro
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
      "edacconmaakjimmfgnblocblbcdcpbko" # session buddy
    ];
  };

  programs.zathura = {
    enable = true;
    options = {
      default-bg = "#e4e4e4";
      default-fg = "#000000";
      # sandbox = "strict";
      first-page-column = "1:1";
      selection-clipboard = "clipboard";
      guioptions = "sv";
      page-padding = "20";
      pages-per-row = "2";
      advance-pages-per-row = "true";
    };
  };

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs;
      let obs-droidcam = callPackage ../../../packages/obs-droidcam.nix { };
      in [ obs-v4l2sink obs-droidcam ];
  };

  programs.go = {
    enable = true;
    goBin = "go/bin";
  };
}
