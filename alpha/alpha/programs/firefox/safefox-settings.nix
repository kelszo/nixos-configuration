{ ... }: {
  "browser.cache.disk.enable" = false;
  "browser.sessionstore.interval" = 3600000;
  "browser.cache.disk_cache_ssl" = false;

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
  # "dom.event.clipboardevents.enabled" = false;
  "dom.event.contextmenu.enabled" = false;

  "extensions.pocket.enabled" = false;
  "extensions.pocket.site" = "";
  "extensions.pocket.oAuthConsumerKey" = "";
  "extensions.pocket.api" = "";
  "extensions.htmlaboutaddons.recommendations.enabled" = false;

  "geo.enabled" = true;
  "geo.wifi.uri" = ''
    data:application/json,{"location": {"lat": 59.3293, "lng": 18.0686}, "accuracy": 4000.0}'';

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
  "network.security.esni.enabled" = true;
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
}
