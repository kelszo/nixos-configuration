{ fetchzip }:
let version = "1.1.1";
in fetchzip {
  name = "obs-droidcam-${version}";

  url = "https://files.dev47apps.net/obs/droidcam_obs_1.1.1_linux.zip";
  sha256 = "0pr61b29i4g0x4lfpbc6kp8krs0h1b2fdab2cpwr5lslnwm82n0v";

  postFetch = ''
    unzip $downloadedFile

    mkdir -p $out/share/obs/obs-plugins/
    mv droidcam-obs $out/share/obs/obs-plugins/
  '';

  meta = {
    description = "Droidcam OBS plugin";
    longDescription = "";
    homepage = "https://dev47apps.com/obs/";
  };
}
