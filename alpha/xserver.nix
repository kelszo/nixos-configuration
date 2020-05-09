{ pkgs, ... }: {
  services.xserver = {
    enable = true;
    layout = "se";
    libinput.enable = true;
    displayManager = {
      lightdm = {
        enable = true;
        autoLogin = {
          enable = true;
          user = "alpha";
        };
      };
    };

    desktopManager.session = [{
      name = "home-manager";
      start = ''
        ${pkgs.runtimeShell} $HOME/.hm-xsession &
        waitPID=$!
      '';
    }];
  };
}
