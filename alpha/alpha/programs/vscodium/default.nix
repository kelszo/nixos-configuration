{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    #userSettings = (import ./settings.nix { });
    #extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace
    #  (builtins.attrValues (import ./extensions.nix { }));
  };
}
