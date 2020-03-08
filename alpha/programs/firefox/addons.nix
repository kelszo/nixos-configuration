{ buildFirefoxXpiAddon, fetchurl, stdenv, ... }:
{
  "google-container" = buildFirefoxXpiAddon {
    pname = "google-container";
    version = "1.5.0";
    addonId = "@contain-google";
    url = "https://addons.mozilla.org/firefox/downloads/file/3386853/google_container-1.5.0-fx.xpi?src=";
    sha256 = "02fknarn3r7rgnd0k9qpkkl8nj336g4hf7p09rbr708w34q3zkjq";
    meta = with stdenv.lib;{};

  };

  "double-click" = buildFirefoxXpiAddon {
    pname = "double-click";
    version = "1.0";
    addonId = "Double_Click_New_Tab_senna5150ando@gmail.com";
    url = "https://addons.mozilla.org/firefox/downloads/file/884173/double_click_new_tab-1.0-an+fx-linux.xpi?src=";
    sha256 = "088y8pi22igfpw9p6d63gvimdifaqx3xwydq7pbqbjfyvvbq40lg";
    meta = with stdenv.lib;{};
  };

  "tab-session-manager" = buildFirefoxXpiAddon {
    pname = "tab-session-manager";
    version = "5.2.0";
    addonId = "Tab-Session-Manager@sienori";
    url = "https://addons.mozilla.org/firefox/downloads/file/3477828/tab_session_manager-5.2.0-fx.xpi?src=";
    sha256 = "10v6zdvg4rnlx66q0fabmzj8k5ifc9cj4rqhgr6gsxhgpkqg5p6q";
    meta = with stdenv.lib;{};
  };

  "tree-style-tab" = buildFirefoxXpiAddon {
    pname = "tree-style-tab";
    version = "3.3.6";
    addonId = "treestyletab@piro.sakura.ne.jp";
    url = "https://addons.mozilla.org/firefox/downloads/file/3511277/tree_style_tab_-3.3.6-fx.xpi?src=";
    sha256 = "09849frhc12w94ig7m405lrgcmr434a6204dazg4nmrmh8rckizr";
    meta = with stdenv.lib;{};
  };

  "user-agent-switcher" = buildFirefoxXpiAddon {
    pname = "user-agent-switcher";
    version = "1.3.24";
    addonId = "user-agent-switcher@ninetailed.ninja";
    url = "https://addons.mozilla.org/firefox/downloads/file/3511365/user_agent_switcher-1.3.24-an+fx.xpi?src=";
    sha256 = "1mv1ini2pbkvilgzvp9kvpav264c69i8wq3swa4sc908khfkg128";
    meta = with stdenv.lib;{};
  };

  "canvas-blocker" = buildFirefoxXpiAddon {
    pname = "canvas-blocker";
    version = "1.1";
    addonId = "CanvasBlocker@kkapsner.de";
    url = "https://addons.mozilla.org/firefox/downloads/file/3495172/canvasblocker-1.1-an+fx.xpi?src=";
    sha256 = "0xms92kbwfgyrjkq6jqa08wivbyxs2vsprnagdqv4dp1pf0i416r";
    meta = with stdenv.lib;{};
  };
}