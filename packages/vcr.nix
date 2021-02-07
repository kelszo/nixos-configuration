{ fetchzip }:
let version = "1.001";
in fetchzip {
  name = "vcr-osd-mono-ttf-${version}";

  url = "https://dl.dafont.com/dl/?f=vcr_osd_mono";
  sha256 = "052zzsnybymim2p5kvpcm76y3d58r75j4k7xi63kh4gx5p7hvjry";

  postFetch = ''
    unzip -j $downloadedFile
    for i in *.ttf; do
      local destname="$(echo "$i" | sed -E 's|-[[:digit:].]+\.ttf$|.ttf|')"
      install -Dm 644 "$i" "$out/share/fonts/truetype/$destname"
    done
  '';

  meta = {
    description = "VCR OSD TTF";
    longDescription = ''
      Monospaced bitmap font by by Riciery Leal
    '';
    homepage = "https://www.dafont.com/vcr-osd-mono.font";
  };
}
