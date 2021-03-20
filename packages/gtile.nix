{ fetchzip }:
let
  pname = "gTile";
  version = "42";

  uuid = "gTile@vibou";
in
fetchzip {
  name = "${pname}-${version}";

  url = "https://extensions.gnome.org/download-extension/gTile@vibou.shell-extension.zip?version_tag=21751";
  sha256 = "1b6hkq7k3iv3m4zkxgw4hka19q6qzf84la3k4dxnzxvbh687fbp5";

  postFetch = ''
    mkdir -p $out/share/gnome-shell/extensions/${uuid}
    unzip $downloadedFile -d $out/share/gnome-shell/extensions/${uuid}
  '';

}
