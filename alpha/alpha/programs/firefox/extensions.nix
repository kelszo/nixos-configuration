{ buildFirefoxXpiAddon, fetchurl, lib, stdenv }:
{
  "amiunique" = buildFirefoxXpiAddon {
    pname = "amiunique";
    version = "1.0.9";
    addonId = "@amiunique-extension";
    url = "https://addons.mozilla.org/firefox/downloads/file/3727610/amiunique-1.0.9-fx.xpi";
    sha256 = "7e5c9fedfea028da404917804408b05275fd8b41b4d5252c4730308d51ba0cd6";
    meta = with lib;
      {
        homepage = "https://amiunique.org";
        description = "An extension to follow the evolution of your browser fingerprint! Be notified as soon as a change is detected!";
        license = licenses.gpl3;
        platforms = platforms.all;
      };
  };
  "bitwarden-password-manager" = buildFirefoxXpiAddon {
    pname = "bitwarden-password-manager";
    version = "1.48.1";
    addonId = "{446900e4-71c2-419f-a6a7-df9c091e268b}";
    url = "https://addons.mozilla.org/firefox/downloads/file/3714988/bitwarden_free_password_manager-1.48.1-an+fx.xpi";
    sha256 = "27088233b72c36f8636ae88e79d7e52a0b4480d7fc73ed6412233a2f95408256";
    meta = with lib;
      {
        homepage = "https://bitwarden.com";
        description = "A secure and free password manager for all of your devices.";
        license = licenses.gpl3;
        platforms = platforms.all;
      };
  };
  "canvasblocker" = buildFirefoxXpiAddon {
    pname = "canvasblocker";
    version = "1.5";
    addonId = "CanvasBlocker@kkapsner.de";
    url = "https://addons.mozilla.org/firefox/downloads/file/3711139/canvasblocker-1.5-an+fx.xpi";
    sha256 = "1ec7cfcf8567a2b70a8405980f0143316c560539688e9f43e8069f069bae5d51";
    meta = with lib;
      {
        homepage = "https://github.com/kkapsner/CanvasBlocker/";
        description = "Alters some JS APIs to prevent fingerprinting.";
        license = licenses.mpl20;
        platforms = platforms.all;
      };
  };
  "clearurls" = buildFirefoxXpiAddon {
    pname = "clearurls";
    version = "1.20.0";
    addonId = "{74145f27-f039-47ce-a470-a662b129930a}";
    url = "https://addons.mozilla.org/firefox/downloads/file/3682334/clearurls-1.20.0-an+fx.xpi";
    sha256 = "2d4bdd6c702999f2d76c97cbd6a0bb80cbdef4665c3c104b38824e9dc0616df2";
    meta = with lib;
      {
        homepage = "https://clearurls.xyz/";
        description = "Removes tracking elements from URLs";
        license = licenses.lgpl3;
        platforms = platforms.all;
      };
  };
  "cookie-autodelete" = buildFirefoxXpiAddon {
    pname = "cookie-autodelete";
    version = "3.6.0";
    addonId = "CookieAutoDelete@kennydo.com";
    url = "https://addons.mozilla.org/firefox/downloads/file/3711829/cookie_autodelete-3.6.0-an+fx.xpi";
    sha256 = "f83646d42f476c86384164fd4868fa9c5b7452491f1f37d4e219c3fb3c421def";
    meta = with lib;
      {
        homepage = "https://github.com/Cookie-AutoDelete/Cookie-AutoDelete";
        description = "Control your cookies! This WebExtension is inspired by Self Destructing Cookies. When a tab closes, any cookies not being used are automatically deleted. Whitelist the ones you trust while deleting the rest. Support for Container Tabs.";
        license = licenses.mit;
        platforms = platforms.all;
      };
  };
  "css-exfil-protection" = buildFirefoxXpiAddon {
    pname = "css-exfil-protection";
    version = "1.1.0";
    addonId = "{7fc8ef53-24ec-4205-87a4-1e745953bb0d}";
    url = "https://addons.mozilla.org/firefox/downloads/file/3631278/css_exfil_protection-1.1.0-an+fx.xpi";
    sha256 = "1e31940698d3c5477a6980688ba21125d70afff21e02915956d4b0386d44ab5d";
    meta = with lib;
      {
        homepage = "https://www.mike-gualtieri.com/css-exfil-vulnerability-tester";
        description = "Guard your browser against CSS Exfil attacks!\n\nCSS Exfil is a method attackers can use to steal data from web pages using Cascading Style Sheets (CSS).  This plugin sanitizes and blocks any CSS rules which may be designed to steal data.";
        license = licenses.mit;
        platforms = platforms.all;
      };
  };
  "decentraleyes" = buildFirefoxXpiAddon {
    pname = "decentraleyes";
    version = "2.0.15";
    addonId = "jid1-BoFifL9Vbdl2zQ@jetpack";
    url = "https://addons.mozilla.org/firefox/downloads/file/3672658/decentraleyes-2.0.15-an+fx.xpi";
    sha256 = "2554069168458cc1351e5d37ee995de044e514ec72369829ff0bcbf31d586ddf";
    meta = with lib;
      {
        homepage = "https://decentraleyes.org";
        description = "Protects you against tracking through \"free\", centralized, content delivery. It prevents a lot of requests from reaching networks like Google Hosted Libraries, and serves local files to keep sites from breaking. Complements regular content blockers.";
        license = licenses.mpl20;
        platforms = platforms.all;
      };
  };
  "double_click_new_tab" = buildFirefoxXpiAddon {
    pname = "double_click_new_tab";
    version = "1.0";
    addonId = "Double_Click_New_Tab_senna5150ando@gmail.com";
    url = "https://addons.mozilla.org/firefox/downloads/file/884173/double_click_new_tab-1.0-an+fx-linux.xpi";
    sha256 = "8f0282d7dedec985d73db879de47c7cac556e37ec3347313bfee4521e2451e21";
    meta = with lib;
      {
        description = "Open links as background tabs by Double clicking links";
        license = licenses.mit;
        platforms = platforms.all;
      };
  };
  "facebook-container" = buildFirefoxXpiAddon {
    pname = "facebook-container";
    version = "2.1.2";
    addonId = "@contain-facebook";
    url = "https://addons.mozilla.org/firefox/downloads/file/3650887/facebook_container-2.1.2-fx.xpi";
    sha256 = "86c75e90ae6f3f59999406c34229f05d563e024e293dfcabcfea10c75ce76cf7";
    meta = with lib;
      {
        homepage = "https://github.com/mozilla/contain-facebook";
        description = "Prevent Facebook from tracking you around the web. The Facebook Container extension for Firefox helps you take control and isolate your web activity from Facebook.";
        license = licenses.mpl20;
        platforms = platforms.all;
      };
  };
  "google-container" = buildFirefoxXpiAddon {
    pname = "google-container";
    version = "1.5.3";
    addonId = "@contain-google";
    url = "https://addons.mozilla.org/firefox/downloads/file/3691597/google_container-1.5.3-fx.xpi";
    sha256 = "b92be6ae7d9a3814a16752453c845b1175e97a2314bdcef4d5a552ea8ecc4583";
    meta = with lib;
      {
        homepage = "https://github.com/containers-everywhere/contain-google";
        description = "THIS IS NOT AN OFFICIAL ADDON FROM MOZILLA!\nIt is a fork of the Facebook Container addon.\n\nPrevent Google from tracking you around the web. The Google Container extension helps you take control and isolate your web activity from Google.";
        license = licenses.mpl20;
        platforms = platforms.all;
      };
  };
  "gorans-hemmasnickrade-ordli" = buildFirefoxXpiAddon {
    pname = "gorans-hemmasnickrade-ordli";
    version = "1.21";
    addonId = "swedish@dictionaries.addons.mozilla.org";
    url = "https://addons.mozilla.org/firefox/downloads/file/3539390/swedish_dictionary-1.21.xpi";
    sha256 = "7d2ce7f7bfb65cfb5dd4138686acd977cf589c6ce91fc342ae5e2e26a09d1dbe";
    meta = with lib;
      {
        description = "Swedish spell-check dictionary.";
        license = licenses.lgpl3;
        platforms = platforms.all;
      };
  };
  "https-everywhere" = buildFirefoxXpiAddon {
    pname = "https-everywhere";
    version = "2021.1.27";
    addonId = "https-everywhere@eff.org";
    url = "https://addons.mozilla.org/firefox/downloads/file/3716461/https_everywhere-2021.1.27-an+fx.xpi";
    sha256 = "da049748bba7282c0f8c0ab85ac8f494e795e79d6bdc6f9f726d687aa8cc2a1f";
    meta = with lib;
      {
        homepage = "https://www.eff.org/https-everywhere";
        description = "Encrypt the web! HTTPS Everywhere is a Firefox extension to protect your communications by enabling HTTPS encryption automatically on sites that are known to support it, even when you type URLs or follow links that omit the https: prefix.";
        platforms = platforms.all;
      };
  };
  "neat-url" = buildFirefoxXpiAddon {
    pname = "neat-url";
    version = "5.0.0";
    addonId = "neaturl@hugsmile.eu";
    url = "https://addons.mozilla.org/firefox/downloads/file/3557562/neat_url-5.0.0-an+fx.xpi";
    sha256 = "0b41899ea0eb424517bbe7ce067eae22de0ff659a0f171671e604edef86cfa2c";
    meta = with lib;
      {
        homepage = "http://hugsmile.eu";
        description = "Remove garbage from URLs.";
        license = licenses.gpl2;
        platforms = platforms.all;
      };
  };
  "privacy-possum" = buildFirefoxXpiAddon {
    pname = "privacy-possum";
    version = "2019.7.18";
    addonId = "woop-NoopscooPsnSXQ@jetpack";
    url = "https://addons.mozilla.org/firefox/downloads/file/3360398/privacy_possum-2019.7.18-an+fx.xpi";
    sha256 = "0840a8c443e25d8a65da22ce1b557216456b900a699b3541e42e1b47e8cb6c0e";
    meta = with lib;
      {
        homepage = "https://github.com/cowlicks/privacypossum";
        description = "Privacy Possum monkey wrenches common commercial tracking methods by reducing and falsifying the data gathered by tracking companies.";
        license = licenses.gpl3;
        platforms = platforms.all;
      };
  };
  "skip-redirect" = buildFirefoxXpiAddon {
    pname = "skip-redirect";
    version = "2.3.4";
    addonId = "skipredirect@sblask";
    url = "https://addons.mozilla.org/firefox/downloads/file/3632211/skip_redirect-2.3.4-an+fx.xpi";
    sha256 = "bee434ea6410aca1321a20ed62a15b3b3c295d95eb4445b88adb0970652f1b3a";
    meta = with lib;
      {
        description = "Some web pages use intermediary pages before redirecting to a final page. This add-on tries to extract the final url from the intermediary url and goes there straight away if successful.";
        license = licenses.mit;
        platforms = platforms.all;
      };
  };
  "smart-referer" = buildFirefoxXpiAddon {
    pname = "smart-referer";
    version = "0.2.15";
    addonId = "smart-referer@meh.paranoid.pk";
    url = "https://addons.mozilla.org/firefox/downloads/file/3470999/smart_referer-0.2.15-an+fx.xpi";
    sha256 = "4751ab905c4d9d13b1f21c9fc179efed7d248e3476effb5b393268b46855bf1a";
    meta = with lib;
      {
        homepage = "https://gitlab.com/smart-referer/smart-referer";
        description = "Improve your privacy by limiting Referer information leak!";
        platforms = platforms.all;
      };
  };
  "tab-session-manager" = buildFirefoxXpiAddon {
    pname = "tab-session-manager";
    version = "6.4.0";
    addonId = "Tab-Session-Manager@sienori";
    url = "https://addons.mozilla.org/firefox/downloads/file/3693191/tab_session_manager-6.4.0-fx.xpi";
    sha256 = "10decc0b2e57d641afa58bf61a600e5448a17cca147e8c72c04a8867d8ab12c4";
    meta = with lib;
      {
        homepage = "https://tab-session-manager.sienori.com/";
        description = "Save and restore the state of windows and tabs. It also supports automatic saving and cloud sync.";
        license = licenses.mpl20;
        platforms = platforms.all;
      };
  };
  "temporary-containers" = buildFirefoxXpiAddon {
    pname = "temporary-containers";
    version = "1.9.2";
    addonId = "{c607c8df-14a7-4f28-894f-29e8722976af}";
    url = "https://addons.mozilla.org/firefox/downloads/file/3723251/temporary_containers-1.9.2-fx.xpi";
    sha256 = "3340a08c29be7c83bd0fea3fc27fde71e4608a4532d932114b439aa690e7edc0";
    meta = with lib;
      {
        homepage = "https://github.com/stoically/temporary-containers";
        description = "Open tabs, websites, and links in automatically managed disposable containers. Containers isolate data websites store (cookies, storage, and more) from each other, enhancing your privacy and security while you browse.";
        license = licenses.mit;
        platforms = platforms.all;
      };
  };
  "tree-style-tab" = buildFirefoxXpiAddon {
    pname = "tree-style-tab";
    version = "3.7.3";
    addonId = "treestyletab@piro.sakura.ne.jp";
    url = "https://addons.mozilla.org/firefox/downloads/file/3734736/tree_style_tab_-3.7.3-fx.xpi";
    sha256 = "9b2bf3723115c6d389197afa374ac8294d95ca5e3e74a68dba5f365536cab9f6";
    meta = with lib;
      {
        homepage = "http://piro.sakura.ne.jp/xul/_treestyletab.html.en";
        description = "Show tabs like a tree.";
        platforms = platforms.all;
      };
  };
  "ublock-origin" = buildFirefoxXpiAddon {
    pname = "ublock-origin";
    version = "1.33.2";
    addonId = "uBlock0@raymondhill.net";
    url = "https://addons.mozilla.org/firefox/downloads/file/3719054/ublock_origin-1.33.2-an+fx.xpi";
    sha256 = "5c3a5ef6f5b5475895053238026360020d6793b05541d20032ea9dd1c9cae451";
    meta = with lib;
      {
        homepage = "https://github.com/gorhill/uBlock#ublock-origin";
        description = "Finally, an efficient wide-spectrum content blocker. Easy on CPU and memory.";
        license = licenses.gpl3;
        platforms = platforms.all;
      };
  };
  "umatrix" = buildFirefoxXpiAddon {
    pname = "umatrix";
    version = "1.4.0";
    addonId = "uMatrix@raymondhill.net";
    url = "https://addons.mozilla.org/firefox/downloads/file/3396815/umatrix-1.4.0-an+fx.xpi";
    sha256 = "991f0fa5c64172b8a2bc0a010af60743eba1c18078c490348e1c6631882cbfc7";
    meta = with lib;
      {
        homepage = "https://github.com/gorhill/uMatrix";
        description = "Point &amp; click to forbid/allow any class of requests made by your browser. Use it to block scripts, iframes, ads, facebook, etc.";
        license = licenses.gpl3;
        platforms = platforms.all;
      };
  };
  "user-agent-string-switcher" = buildFirefoxXpiAddon {
    pname = "user-agent-string-switcher";
    version = "0.4.6";
    addonId = "{a6c4a591-f1b2-4f03-b3ff-767e5bedf4e7}";
    url = "https://addons.mozilla.org/firefox/downloads/file/3700959/user_agent_switcher_and_manager-0.4.6-an+fx.xpi";
    sha256 = "36f69e0ac3c22c5d8b498098bd96e3cc07acf70a51f0219c51504403265599a1";
    meta = with lib;
      {
        homepage = "http://add0n.com/useragent-switcher.html";
        description = "Spoof websites trying to gather information about your web navigation—like your browser type and operating system—to deliver distinct content you may not want.";
        license = licenses.mpl20;
        platforms = platforms.all;
      };
  };
}
