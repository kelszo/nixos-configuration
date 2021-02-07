{ pkgs, ... }: {

  # dconf dump / > dconf.settings
  # dconf2nix -i dconf.settings -o dconf.nix
  imports = [ ./dconf.nix ];

  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.callPackage ../../../packages/whitesur-icons.nix { };
      name = "whitesur";
    };
    theme = {
      package = pkgs.callPackage ../../../packages/whitesur-theme.nix { };
      name = "whitesur";
    };
    font = {
      package = pkgs.callPackage ../../../packages/san-francisco.nix { };
      name = "San Francisco";
    };
  };

  xsession.pointerCursor = {
    package = pkgs.capitaine-cursors;
    name = "Capitaine";
  };

}
