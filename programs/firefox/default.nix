{ pkgs, fetchurl, stdenv, ... }: {
  programs.firefox = {
    enable = true;
    enableGnomeExtensions = true;
    package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
      forceWayland = true;
      extraPolicies = {
        ExtensionSettings = {};
      };
    };
    profiles = {
      safefox = {
        id = 0;
        isDefault = true;
        settings = (import ./settings.nix {});
        userChrome = (builtins.readFile ./userChrome.css);
      };
    };

    # nixpkgs-firefox-addons firefox-addons.json extensions.nix
    extensions = builtins.attrValues (
      import ./extensions.nix {
        inherit (pkgs) fetchurl lib stdenv;
        buildFirefoxXpiAddon =
          pkgs.nur.repos.rycee.firefox-addons.buildFirefoxXpiAddon;
      }
    );
  };
}
