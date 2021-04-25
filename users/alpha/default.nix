{ pkgs, ... }: {
  imports = [
    (import "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz}/nixos")
  ];


  users.users.alpha = {
    isNormalUser = true;
    home = "/home/alpha";
    description = "alpha";
    shell = pkgs.zsh;
    extraGroups =
      [ "wheel" "networkmanager" "docker" "sound" "video" "pulse" "audio" "kvm" "libvirtd" ];
  };

  home-manager.users.alpha = import ./home.nix;

}
