{ buildFirefoxXpiAddon, fetchurl, stdenv }: {
  "4chan-faster-images" = buildFirefoxXpiAddon {
    pname = "4chan-faster-images";
    version = "1.3";
    addonId = "{566e68fa-612c-492f-a2d8-a925cc672b56}";
    url =
      "https://addons.mozilla.org/firefox/downloads/file/978937/4chan_faster_images-1.3-an+fx.xpi?src=";
    sha256 = "b713e0628726bfadfaf3d63560d508b00ace7fdf48cf204d4100ddeb4f0fac46";
    meta = with stdenv.lib; {
      description = ''
        Redirects alternate image servers (<a rel="nofollow" href="https://outgoing.prod.mozaws.net/v1/275f5796211162a3c1af8dc8d2e0bd3fbfea5e7bcc942202348567f8f4278cbb/http%3A//is.4chan.org">is.4chan.org</a>, <a rel="nofollow" href="https://outgoing.prod.mozaws.net/v1/e7a05b35679ce82a1b7e8531c81fbbaabfc9f74be528c18dab79dd3684e38398/http%3A//is2.4chan.org">is2.4chan.org</a>, <a rel="nofollow" href="https://outgoing.prod.mozaws.net/v1/2efb413ff0ae45afef1a161fedcba47ec49422892267cbf6a6c94a6129f7f3d4/http%3A//is3.4chan.org">is3.4chan.org</a>) requests to <a rel="nofollow" href="https://outgoing.prod.mozaws.net/v1/4fb4a85a9c17ddcf86a725aba3b261358ab35c83292e6aa466843bde8fd1d6d1/http%3A//i.4cdn.org">i.4cdn.org</a> on <a rel="nofollow" href="https://outgoing.prod.mozaws.net/v1/5bd5997ffc904f5dfc97f3f673fe09ba0638388c518d81501ac67ad456186a4d/http%3A//4chan.org">4chan.org</a>.'';
      license = licenses.gpl2;
      platforms = platforms.all;
    };
  };
  "bitwarden-password-manager" = buildFirefoxXpiAddon {
    pname = "bitwarden-password-manager";
    version = "1.43.4";
    addonId = "{446900e4-71c2-419f-a6a7-df9c091e268b}";
    url =
      "https://addons.mozilla.org/firefox/downloads/file/3533484/bitwarden_free_password_manager-1.43.4-an+fx.xpi?src=";
    sha256 = "1e1701fcb4f120cefecfcfd8302a75735809f7f7b0d4ef687625c3b3af5cdcd0";
    meta = with stdenv.lib; {
      homepage = "https://bitwarden.com";
      description =
        "A secure and free password manager for all of your devices.";
      license = licenses.gpl3;
      platforms = platforms.all;
    };
  };
  "canvasblocker" = buildFirefoxXpiAddon {
    pname = "canvasblocker";
    version = "1.2";
    addonId = "CanvasBlocker@kkapsner.de";
    url =
      "https://addons.mozilla.org/firefox/downloads/file/3528876/canvasblocker-1.2-an+fx.xpi?src=";
    sha256 = "8666579a1a005bf0f0588202422c38ab35b12ede2755de864df7a9f69f5e040a";
    meta = with stdenv.lib; {
      homepage = "https://github.com/kkapsner/CanvasBlocker/";
      description = "Alters some JS APIs to prevent fingerprinting.";
      license = licenses.mpl20;
      platforms = platforms.all;
    };
  };
  "cookie-autodelete" = buildFirefoxXpiAddon {
    pname = "cookie-autodelete";
    version = "3.1.1";
    addonId = "CookieAutoDelete@kennydo.com";
    url =
      "https://addons.mozilla.org/firefox/downloads/file/3530747/cookie_autodelete-3.1.1-an+fx.xpi?src=";
    sha256 = "f13eac57fe7f0b3a443565b4d4dfcaf9d190277c6d21e6a28297fd87e2c52076";
    meta = with stdenv.lib; {
      homepage = "https://github.com/mrdokenny/Cookie-AutoDelete";
      description =
        "Control your cookies! This WebExtension is inspired by Self Destructing Cookies. When a tab closes, any cookies not being used are automatically deleted. Whitelist the ones you trust while deleting the rest. Support for Container Tabs.";
      license = licenses.mit;
      platforms = platforms.all;
    };
  };
  "decentraleyes" = buildFirefoxXpiAddon {
    pname = "decentraleyes";
    version = "2.0.14";
    addonId = "jid1-BoFifL9Vbdl2zQ@jetpack";
    url =
      "https://addons.mozilla.org/firefox/downloads/file/3539177/decentraleyes-2.0.14-an+fx.xpi?src=";
    sha256 = "71a55834ee991605d461f304271f989aa1147e1cf772e25787cbada19ab0ba51";
    meta = with stdenv.lib; {
      homepage = "https://decentraleyes.org";
      description = ''
        Protects you against tracking through "free", centralized, content delivery. It prevents a lot of requests from reaching networks like Google Hosted Libraries, and serves local files to keep sites from breaking. Complements regular content blockers.'';
      license = licenses.mpl20;
      platforms = platforms.all;
    };
  };
  "disconnect" = buildFirefoxXpiAddon {
    pname = "disconnect";
    version = "5.19.3";
    addonId = "2.0@disconnect.me";
    url =
      "https://addons.mozilla.org/firefox/downloads/file/3363084/disconnect-5.19.3-fx.xpi?src=";
    sha256 = "0c3c632fd997de1459d21e757c6ceeaa90e533d1bb434014b63bbac797894a3d";
    meta = with stdenv.lib; {
      homepage = "https://disconnect.me/";
      description = "Make the web faster, more private, and more secure.";
      license = licenses.gpl3;
      platforms = platforms.all;
    };
  };
  "double_click_new_tab" = buildFirefoxXpiAddon {
    pname = "double_click_new_tab";
    version = "1.0";
    addonId = "Double_Click_New_Tab_senna5150ando@gmail.com";
    url =
      "https://addons.mozilla.org/firefox/downloads/file/884173/double_click_new_tab-1.0-an+fx-linux.xpi?src=";
    sha256 = "8f0282d7dedec985d73db879de47c7cac556e37ec3347313bfee4521e2451e21";
    meta = with stdenv.lib; {
      description = "Open links as background tabs by Double clicking links";
      license = licenses.mit;
      platforms = platforms.all;
    };
  };
  "facebook-container" = buildFirefoxXpiAddon {
    pname = "facebook-container";
    version = "2.1.0";
    addonId = "@contain-facebook";
    url =
      "https://addons.mozilla.org/firefox/downloads/file/3519841/facebook_container-2.1.0-fx.xpi?src=";
    sha256 = "01f50f3e54e5120361b88feb549263b552946231d30d84ecb686d14676074235";
    meta = with stdenv.lib; {
      homepage = "https://github.com/mozilla/contain-facebook";
      description =
        "Prevent Facebook from tracking you around the web. The Facebook Container extension for Firefox helps you take control and isolate your web activity from Facebook.";
      license = licenses.mpl20;
      platforms = platforms.all;
    };
  };
  "google-container" = buildFirefoxXpiAddon {
    pname = "google-container";
    version = "1.5.0";
    addonId = "@contain-google";
    url =
      "https://addons.mozilla.org/firefox/downloads/file/3386853/google_container-1.5.0-fx.xpi?src=";
    sha256 = "58ce3f30191c8193574ee01e07c93363488be89c17a7099a7df9e461b3b2d309";
    meta = with stdenv.lib; {
      homepage = "https://github.com/containers-everywhere/contain-google";
      description = ''
        THIS IS NOT AN OFFICIAL ADDON FROM MOZILLA!
        It is a fork of the Facebook Container addon.

        Prevent Google from tracking you around the web. The Google Container extension helps you take control and isolate your web activity from Google.'';
      license = licenses.mpl20;
      platforms = platforms.all;
    };
  };
  "swedish-dictionary" = buildFirefoxXpiAddon {
    pname = "swedish-dictionary";
    version = "1.21";
    addonId = "swedish@dictionaries.addons.mozilla.org";
    url =
      "https://addons.mozilla.org/firefox/downloads/file/3539390/swedish_dictionary-1.21.xpi?src=";
    sha256 = "7d2ce7f7bfb65cfb5dd4138686acd977cf589c6ce91fc342ae5e2e26a09d1dbe";
    meta = with stdenv.lib; {
      description = "Swedish spell-check dictionary.";
      license = licenses.lgpl3;
      platforms = platforms.all;
    };
  };
  "https-everywhere" = buildFirefoxXpiAddon {
    pname = "https-everywhere";
    version = "2020.3.16";
    addonId = "https-everywhere@eff.org";
    url =
      "https://addons.mozilla.org/firefox/downloads/file/3528100/https_everywhere-2020.3.16-an+fx.xpi?src=";
    sha256 = "6fa87c2f90d938f49cbd8ea949a6ca0999687952af3293cab1b11f5bc0b7b9ff";
    meta = with stdenv.lib; {
      homepage = "https://www.eff.org/https-everywhere";
      description =
        "Encrypt the web! HTTPS Everywhere is a Firefox extension to protect your communications by enabling HTTPS encryption automatically on sites that are known to support it, even when you type URLs or follow links that omit the https: prefix.";
      platforms = platforms.all;
    };
  };
  "image-expander-4chan" = buildFirefoxXpiAddon {
    pname = "image-expander-4chan";
    version = "0.4";
    addonId = "{3859d492-cbb8-4ce1-a1c2-d9394ea829df}";
    url =
      "https://addons.mozilla.org/firefox/downloads/file/776266/4chan_image_expander_saver-0.4-an+fx-windows.xpi?src=";
    sha256 = "9c0ac9fefb3e16048dd4dc6086e9f32a2d9daacc0c0b019c9700b43c126a1a50";
    meta = with stdenv.lib; {
      description = ''
        Expand the images and Videos of  <a rel="nofollow" href="https://outgoing.prod.mozaws.net/v1/5bd5997ffc904f5dfc97f3f673fe09ba0638388c518d81501ac67ad456186a4d/http%3A//4chan.org">4chan.org</a>'';
      license = licenses.mpl20;
      platforms = platforms.all;
    };
  };
  "privacy-possum" = buildFirefoxXpiAddon {
    pname = "privacy-possum";
    version = "2019.7.18";
    addonId = "woop-NoopscooPsnSXQ@jetpack";
    url =
      "https://addons.mozilla.org/firefox/downloads/file/3360398/privacy_possum-2019.7.18-an+fx.xpi?src=";
    sha256 = "0840a8c443e25d8a65da22ce1b557216456b900a699b3541e42e1b47e8cb6c0e";
    meta = with stdenv.lib; {
      homepage = "https://github.com/cowlicks/privacypossum";
      description =
        "Privacy Possum monkey wrenches common commercial tracking methods by reducing and falsifying the data gathered by tracking companies.";
      license = licenses.gpl3;
      platforms = platforms.all;
    };
  };
  "tab-session-manager" = buildFirefoxXpiAddon {
    pname = "tab-session-manager";
    version = "5.2.0";
    addonId = "Tab-Session-Manager@sienori";
    url =
      "https://addons.mozilla.org/firefox/downloads/file/3477828/tab_session_manager-5.2.0-fx.xpi?src=";
    sha256 = "d8dcf2f0bc0f76fd4c7e10672259622e9689e4af4b39808de9d466f276fb6683";
    meta = with stdenv.lib; {
      description =
        "Save and restore the state of windows and tabs. It also supports automatic saving.";
      license = licenses.mpl20;
      platforms = platforms.all;
    };
  };
  "tree-style-tab" = buildFirefoxXpiAddon {
    pname = "tree-style-tab";
    version = "3.4.8";
    addonId = "treestyletab@piro.sakura.ne.jp";
    url =
      "https://addons.mozilla.org/firefox/downloads/file/3536021/tree_style_tab_-3.4.8-fx.xpi?src=";
    sha256 = "93b297737d95a759f438d3d075101dec20b3768de008818af45e6d987555b9a3";
    meta = with stdenv.lib; {
      homepage = "http://piro.sakura.ne.jp/xul/_treestyletab.html.en";
      description = "Show tabs like a tree.";
      platforms = platforms.all;
    };
  };
  "ublock-origin" = buildFirefoxXpiAddon {
    pname = "ublock-origin";
    version = "1.25.2";
    addonId = "uBlock0@raymondhill.net";
    url =
      "https://addons.mozilla.org/firefox/downloads/file/3521827/ublock_origin-1.25.2-an+fx.xpi?src=";
    sha256 = "997aac00064665641298047534c9392492ef09f0cbf177b6a30d4fa288081579";
    meta = with stdenv.lib; {
      homepage = "https://github.com/gorhill/uBlock#ublock-origin";
      description = "Finally, an efficient blocker. Easy on CPU and memory.";
      license = licenses.gpl3;
      platforms = platforms.all;
    };
  };
  "user-agent-string-switcher" = buildFirefoxXpiAddon {
    pname = "user-agent-string-switcher";
    version = "0.3.5";
    addonId = "{a6c4a591-f1b2-4f03-b3ff-767e5bedf4e7}";
    url =
      "https://addons.mozilla.org/firefox/downloads/file/3527040/user_agent_switcher_and_manager-0.3.5-an+fx.xpi?src=";
    sha256 = "ad54cff6efbb0209dfdb30670519b38ab7db6e489978fe6a1fce8dc46ccbd0ed";
    meta = with stdenv.lib; {
      homepage = "http://add0n.com/useragent-switcher.html";
      description =
        "Spoof websites trying to gather information about your web navigation—like your browser type and operating system—to deliver distinct content you may not want.";
      license = licenses.mpl20;
      platforms = platforms.all;
    };
  };
}
