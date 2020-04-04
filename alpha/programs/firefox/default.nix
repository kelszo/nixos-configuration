{ pkgs, fetchurl, stdenv, ... }: {
  programs.firefox = {
    enable = true;
    profiles = {
      safefox = {
        id = 0;
        isDefault = true;
        settings = (import ./safefox-settings.nix { });
        userChrome = (builtins.readFile ./userChrome.css);
      };

      fastfox = {
        id = 1;
        isDefault = false;
        settings = (import ./safefox-settings.nix { });
        userChrome = (builtins.readFile ./userChrome.css);
      };
    };

    # nixpkgs-firefox-addons firefox-addons.json extensions.nix
    extensions = builtins.attrValues (import ./extensions.nix {
      inherit (pkgs) stdenv fetchurl;
      buildFirefoxXpiAddon =
        pkgs.nur.repos.rycee.firefox-addons.buildFirefoxXpiAddon;
    });
  };
}
