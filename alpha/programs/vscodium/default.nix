{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    #package = pkgs.vscodium;
    userSettings = {
        "workbench.iconTheme" = "material-icon-theme";
        "workbench.colorTheme" = "Atom One Light";
        "editor.renderWhitespace" = "none";
        "javascript.format.semicolons" = "insert";
        "javascript.implicitProjectConfig.checkJs" = true;
        "javascript.preferences.quoteStyle" = "single";
        "typescript.format.semicolons" = "insert";
        "typescript.preferences.quoteStyle" = "single";
        "prettier.printWidth" = 500;
        "prettier.singleQuote" = true;
        "prettier.trailingComma" = "all";
        "prettier.arrowParens" = "always";
        "editor.formatOnPaste" = true;
        "editor.formatOnSave" = true;
        "editor.suggestSelection" = "first";
        "editor.tabSize" = 2;
    };
    extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "vscode-theme-onelight";
        publisher = "akamud";
        version = "2.1.0";
        sha256 = "1dx08r35bxvmas1ai02v9r25hxadmvm1fh50grq2r4fzqxjgxkqn";
      }
      {
        name = "nix";
        publisher = "bbenoist";
        version = "1.0.1";
        sha256 = "0zd0n9f5z1f0ckzfjr38xw2zzmcxg1gjrava7yahg5cvdcw6l35b";
      }
      {
        name = "project-manager";
        publisher = "alefragnani";
        version = "10.11.0";
        sha256 = "01gyggbk7h3h0pyydbx69xwhqac508xq7jrfqic34nl0jy36clda";
      }
      {
        name = "npm-intellisense";
        publisher = "christian-kohler";
        version = "1.3.0";
        sha256 = "1kr335maavwxyljr7qk2xzzcp7kmiaz98ij9r7bvv6iy4nfsjfyq";
      }
      {
        name = "path-intellisense";
        publisher = "christian-kohler";
        version = "1.4.2";
        sha256 = "0i2b896cnlk1d23w3jgy8wdqsww2lz201iym5c1rqbjzg1g3v3r4";
      }
      {
        name = "gitignore";
        publisher = "codezombiech";
        version = "0.6.0";
        sha256 = "0gnc0691pwkd9s8ldqabmpfvj0236rw7bxvkf0bvmww32kv1ia0b";
      }
      {
        name = "vscode-eslint";
        publisher = "dbaeumer";
        version = "2.1.1";
        sha256 = "11ybn0hrarp1v06zjql9lcbvr70ryhij8v2v23q45gm0qgmpk5ib";
      }
      {
        name = "vscode-npm-script";
        publisher = "eg2";
        version = "0.3.11";
        sha256 = "0mzb6x0ccqbibpmaqw4axgz2ihfxmj3cm0v21sa06a2rszm90v2d";
      }
      {
        name = "prettier-vscode";
        publisher = "esbenp";
        version = "3.20.0";
        sha256 = "09bm1h2ayx75vqwqfm43b7vq3383ph01gvs6r9zqqrzz18m5r1hi";
      }
      {
        name = "vscode-sshfs";
        publisher = "kelvin";
        version = "1.16.3";
        sha256 = "12yqd329fap01dcki624sc6285q5bgiwcv23wijxiz5llgcysn2b";
      }
      {
        name = "dotenv";
        publisher = "mikestead";
        version = "1.0.1";
        sha256 = "0rs57csczwx6wrs99c442qpf6vllv2fby37f3a9rhwc8sg6849vn";
      }
      {
        name = "vscode-for-node-js-development-pack";
        publisher = "nodesource";
        version = "2.0.1";
        sha256 = "0xs3fxik8va8rhzmbv3yq3jb2b49sc27y6llhs2vgy2n20q6hhlk";
      }
      {
        name = "code-spell-checker";
        publisher = "streetsidesoftware";
        version = "1.8.0";
        sha256 = "189daplk4hsj0jza2ck95g65hg3f9rm39cn2swrhi6z6li4xc7y7";
      }
      {
        name = "sort-lines";
        publisher = "tyriar";
        version = "1.9.0";
        sha256 = "0l4wibsjnlbzbrl1wcj18vnm1q4ygvxmh347jvzziv8f1l790qjl";
      }
      {
        name = "vscodeintellicode";
        publisher = "visualstudioexptteam";
        version = "1.2.6";
        sha256 = "087rdcypaa1cwxbrfgdkg3n9rmxr0lb41jdz8y82nigs7a705b0q";
      }
      {
        name = "material-icon-theme";
        publisher = "pkief";
        version = "4.0.1";
        sha256 = "04zv2blnrsy87c4n4sj0yg1s90aad754b6vg02gii3jvqhl5060h";
      }
    ];
  };
}
