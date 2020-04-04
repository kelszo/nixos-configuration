{ pkgs, ... }: {
  # Use Plasma 5
  services.xserver.enable = true;
  services.xserver.layout = "se";
  services.xserver.libinput.enable = true;
  services.xserver.desktopManager.default = "plasma5";

  services.xserver.displayManager.sddm.enable = true;
  services.xserver.displayManager.sddm.autoLogin.enable = true;
  services.xserver.displayManager.sddm.autoLogin.relogin = true;
  services.xserver.displayManager.sddm.autoLogin.user = "alpha";

  services.xserver.desktopManager.plasma5.enable = true;

  services.xserver.desktopManager.plasma5.phononBackend = "vlc";
}
