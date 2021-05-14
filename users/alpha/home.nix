{ pkgs, config, ... }:
let
  nixos-nur = import (
    builtins.fetchTarball
      "https://github.com/nix-community/NUR/archive/master.tar.gz"
  ) {
    inherit pkgs;
  };
in
{
  programs.home-manager.enable = true;

  nixpkgs.config = {
    allowUnfree = true;
    pulseaudio = true;
    packageOverrides = pkgs: { nur = nixos-nur; };
  };

  nixpkgs.overlays = [
    (
      self: super: {
        discord = super.discord.overrideAttrs (
          _: {
            src = builtins.fetchTarball
              "https://discord.com/api/download?platform=linux&format=tar.gz";
          }
        );

        plata-theme = super.plata-theme.overrideAttrs (
          _: {
            version = "0.9.9";
            src = pkgs.fetchFromGitLab {
              owner = "tista500";
              repo = "plata-theme";
              rev = "a231257e5f4f015b886b972480d0d1cbebb5a281";
              sha256 = "1sqmydvx36f6r4snw22s2q4dvcyg30jd7kg7dibpzqn3njfkkfag";
            };
          }
        );

        gnomeExtensions.window-is-ready-remover = super.gnomeExtensions.window-is-ready-remover.overrideAttrs (
          _: {
            version = "1.12";
            src = pkgs.fetchFromGitHub {
              owner = "nunofarruca";
              repo = "WindowIsReady_Remover";
              rev = "5e8bc0d0c800159d2fc98924558980aadf07bce3";
              sha256 = "0yivd8q2mkb2c40n1pndwrsv9bi2lnm3r06wk04vhjc6f8x7qj52";
            };
          }
        );

        gnomeExtensions.sound-output-device-chooser = super.gnomeExtensions.sound-output-device-chooser.overrideAttrs (
          _: {
            version = "38";
            src = pkgs.fetchFromGitHub {
              owner = "kgshank";
              repo = "gse-sound-output-device-chooser";
              rev = "38";
              sha256 = "sha256-Yl5ut6kJAkAAdCBiNFpwDgshXCLMmFH3/zhnFGpyKqs=";
            };
          }
        );

        gnomeExtensions.mpris-indicator-button = super.gnomeExtensions.mpris-indicator-button.overrideAttrs (
          _: {
            version = "2021-04-08";
            src = pkgs.fetchFromGitHub {
              owner = "JasonLG1979";
              repo = "gnome-shell-extension-mpris-indicator-button";
              rev = "c24c68e6d6245b78f9d22ac77a8e73743573e9b5";
              sha256 = "1acsg0w08r4706l55fi10x7gfc5qlpxak5jr1lidlkl9yw0aawcq";
            };
          }
        );

        gnomeExtensions.material-shell = super.gnomeExtensions.material-shell.overrideAttrs (
          _: {
            version = "gnome-13";
            src = pkgs.fetchFromGitHub {
              owner = "material-shell";
              repo = "material-shell";
              rev = "e03bdce2ed787d8aa9b4c2f46043388b7e2028ed";
              sha256 = "0bhq39261v1x21k63sg5jfss2hj2gf8nq6jb1pk68dq3advv973y";
            };
          }
        );

        gnomeExtensions.impatience = super.gnomeExtensions.impatience.overrideAttrs (
          _: {
            version = "2021-04-12";
            src = pkgs.fetchFromGitHub {
              owner = "timbertson";
              repo = "gnome-shell-impatience";
              rev = "e8e132f1cc3743ac33c7fe94b4e93e54551e32e3";
              sha256 = "02xr4lr9iccy3q8l1nls03jx5w03vxwfx340zsw3lzhp3s0wx48s";
            };
          }
        );
      }
    )
  ];

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
  };

  imports = [
    ./packages.nix
    ../../desktops/gnome/home.nix
    ../../programs/firefox
    ../../programs/brave.nix
    ../../programs/zsh.nix

    ../../modules/profiles
  ];

  # NOTE: This is needed for enviroment variables to be set by Home Manager.
  programs.bash.enable = true;

  home = {
    username = "alpha";
    homeDirectory = "/home/alpha";
    stateVersion = "19.09";

    keyboard = {
      layout = "us";
      variant = "altgr-intl";
    };
  };

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs;
      let
        obs-droidcam = callPackage ../../packages/obs-droidcam.nix {};
      in
        [ obs-v4l2sink obs-droidcam ];
  };
}
