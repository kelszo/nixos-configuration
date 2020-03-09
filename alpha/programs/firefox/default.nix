{ pkgs, fetchurl, stdenv, ... }:
{
  programs.firefox = {
    enable = true;
    profiles = {
      safefox = {
        id = 0;
        isDefault = true;
        settings = {
          # userChrome
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          
          "browser.startup.blankWindow" = true;
          "browser.startup.homepage" = "about:blank";
          "signon.rememberSignons" = false;

          # performance      
          "browser.download.animateNotifications" = false;
          "browser.tabs.animate" = false;
          "toolkit.cosmeticAnimations.enabled" = false;
          "html5.offmainthread" = true;
          "layers.acceleration.force-enabled" = true;
          "layers.async-video.enabled" = true;
          "layers.offmainthreadcomposition.async-animations" = true;
          "layers.offmainthreadcomposition.enabled" = true;
          "layout.frame_rate.precise" = true;
          "webgl.force-enabled" = true;

          # security and privacy
          # WebRTC
          "media.peerconnection.enabled" = false;
          "media.peerconnection.turn.disable" = true;
          "media.peerconnection.video.enabled" = false;
          "media.peerconnection.identity.timeout" = 1;

          "browser.aboutHomeSnippets.updateUrL" = "";
          "browser.cache.disk.enable" = false;
          "browser.cache.disk_cache_ssl" = false;
          "browser.cache.memory.enable" = false;
          "browser.cache.offline.enable" = false;
          "browser.formfill.enable" = false;
          "browser.newtabpage.activity-stream.feeds.telemetry" = false;
          "browser.newtabpage.activity-stream.telemetry" = false;
          "browser.ping-centre.telemetry" = false;
          "browser.safebrowsing.enabled" = false;
          "browser.search.geoip.url" = "";
          "browser.selfsupport.url" = "";
          "browser.send_pings" = false;
          "browser.send_pings.require_same_host" = true;
          "browser.sessionstore.privacy_level" = 2;
          "browser.startup.homepage_override.buildID" = "";
          "browser.startup.homepage_override.mstone" = "ignore";
          "browser.urlbar.speculativeConnect.enabled" = false;

          "dom.battery.enabled" = false;
          "dom.event.clipboardevents.enabled" = false;
          "dom.event.contextmenu.enabled" = false;

          "extensions.pocket.enabled" = false;
          "extensions.pocket.site" = "";
          "extensions.pocket.oAuthConsumerKey" = "";
          "extensions.pocket.api" = "";
          "extensions.htmlaboutaddons.recommendations.enabled" = false;

          "geo.enabled" = false;
          "geo.wifi.uri" = "";

          "media.eme.enabled" = false;
          "media.gmp-widevinecdm.enabled" = false;
          "media.navigator.enabled" = false;

          "network.IDN_show_punycode" = true;
          "network.allow-experiments" = false;
          "network.cookie.alwaysAcceptSessionCookies" = false;
          "network.cookie.cookieBehavior" = 1;
          "network.cookie.lifetimePolicy" = 2;
          "network.dns.disablePrefetch" = true;
          "network.dnsCacheEntries" = 100;
          "network.dnsCacheExpiration" = 60;
          "network.http.referer.XOriginPolicy" = 2;
          "network.http.referer.XOriginTrimmingPolicy" = 2;
          "network.http.referer.spoofSource" = true;
          "network.http.sendRefererHeader" = 0;
          "network.http.sendSecureXSiteReferrer" = false;
          "network.http.speculative-parallel-limit" = 0;
          "network.predictor.enabled" = false;
          "network.prefetch-next" = false;
          "network.websocket.enabled" = false;

          "places.history.enabled" = false;

          "plugins.enumerable_names" = "";

          "privacy.donottrackheader.enabled" = true;
          "privacy.firstparty.isolate" = true;
          "privacy.resistFingerprinting" = true;
          "privacy.trackingprotection.cryptomining.enabled" = true;
          "privacy.trackingprotection.enabled" = true;    
          "privacy.trackingprotection.fingerprinting.enabled" = true; 
          "privacy.trackingprotection.socialtracking.enabled" = true; 
          "privacy.clearOnShutdown.history" = true;
          "privacy.clearOnShutdown.siteSettings" = true;

          "startup.homepage_override_url" = "";
          "startup.homepage_welcome_url" = "";
          "startup.homepage_welcome_url.additional" = "";
          
          "toolkit.telemetry.archive.enabled" = false;
          "toolkit.telemetry.bhrPing.enabled" = false;
          "toolkit.telemetry.cachedClientID" = "";
          "toolkit.telemetry.enabled" = false;
          "toolkit.telemetry.firstShutdownPing.enabled" = false;
          "toolkit.telemetry.hybridContent.enabled" = false;
          "toolkit.telemetry.newProfilePing.enabled" = false;
          "toolkit.telemetry.reportingpolicy.firstRun" = false;
          "toolkit.telemetry.server" = "";
          "toolkit.telemetry.shutdownPingSender.enabled" = false;
          "toolkit.telemetry.unified" = false;
          "toolkit.telemetry.updatePing.enabled" = false;
        };

        userChrome = ''
          @namespace url("http://www.mozilla.org/keymaster/gatekeeper/there.is.only.xul");
          
          #main-window[tabsintitlebar="true"]:not([extradragspace="true"]) #TabsToolbar > .toolbar-items {
            opacity: 0;
            pointer-events: none;
          }
          #main-window:not([tabsintitlebar="true"]) #TabsToolbar {
              visibility: collapse !important;
          }
          
          #sidebar-header {
            display: none;
          }
          
          #TabsToolbar {
              visibility: collapse !important;
          }
          
          /* colours */
          :root {
            /* special */
            --foreground: #707070;
            --background: #ffffff;
            --cursorColor: #707070;
            /* black */
            --color0: #d3d3d3;
            --color8: #b3b3b3;
            /* red */
            --color1: #ef6b7b;
            --color9: #ed5466;
            /* green */
            --color2: #a1d569;
            --color10: #afdb80;
            /* yellow */
            --color3: #f59335;
            --color11: #f59335;
            /* blue */
            --color4: #4ec2e8;
            --color12: #5dc7ea;
            /* magenta */
            --color5: #fec7cd;
            --color13: #d2a4b4;
            /* cyan */
            --color6: #95c1c0;
            --color14: #75a1a0;
            /* white */
            --color7: #707070;
            --color15: #464646;
          }
          
          /* Bookmarks Toolbar: no icons */
          #personal-bookmarks .toolbarbutton-icon {
            display: none !important;
          }
          
          /* remove suggested results url bar */
          #PopupAutoCompleteRichResult {
            display: none !important;
          }
          
          #reader-mode-button {
            display: none !important;
          }
          
          /* Bookmarks Toolbar: no icons */
          #personal-bookmarks .toolbarbutton-icon {
            display: none !important;
          }
          
          /* Remove back/forward buttons */
          #back-button, #forward-button {
            display: none !important;
          }
          
          /* Remove close tab button */
          #tabbrowser-tabs .tabbrowser-tab .tab-close-button {
            display: none !important;
          }
          
          /* Remove new tab button */
          #tabbrowser-tabs .tabs-newtab-button {
            display: none !important
          }
          
          .urlbar-history-dropmarker, .urlbar-go-button {
            display: none !important;
          }
          
          .tab-line[selected="true"] {
            display: none !important;
          }
          '';
      };
    };

    extensions = with pkgs.nur.repos.rycee.firefox-addons; [
            bitwarden
            cookie-autodelete
            decentraleyes
            disconnect
            facebook-container
            https-everywhere
            privacy-possum            
            ublock-origin
          ] ++ builtins.attrValues (import ./extensions.nix { 
              inherit (pkgs) stdenv fetchurl;
              buildFirefoxXpiAddon = pkgs.nur.repos.rycee.firefox-addons.buildFirefoxXpiAddon;
            });
  };
}
