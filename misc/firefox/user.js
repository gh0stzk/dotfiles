 /***
 *    ╔═╗╔═╗╔╦╗╔╗ ╦╔═╗  ╔╦╗╦ ╦╔═╗╔╦╗╔═╗	author: z0mbi3
 *    ╔═╝║ ║║║║╠╩╗║║╣    ║ ╠═╣║╣ ║║║║╣ 	url: https://github.com/gh0stzk/dotfiles
 *    ╚═╝╚═╝╩ ╩╚═╝╩╚═╝   ╩ ╩ ╩╚═╝╩ ╩╚═╝	z0mbi3 Fox Firefox Theme
 */
 
 
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
user_pref("browser.cache.disk.enable", false);
user_pref("browser.cache.memory.enable", true);
user_pref("browser.cache.memory.capacity", 524288);
user_pref("browser.sessionstore.interval", 15000000);
user_pref("extensions.pocket.enabled", false);
user_pref("reader.parse-on-load.enabled", false);
user_pref("accessibility.force_disabled", 1);
user_pref("browser.helperApps.deleteTempFileOnExit", true);
user_pref("browser.uitour.enabled", false);

/*** STARTUP ***/

/* set startup page
 * 0=blank, 1=home, 2=last visited page, 3=resume previous session*/
user_pref("browser.startup.page", 0);
/* set HOME+NEWWINDOW page
 * about:home=Firefox Home, custom URL, about:blank*/
user_pref("browser.startup.homepage", "about:blank");
/* disable sponsored content on Firefox Home (Activity Stream)
 * [SETTING] Home>Firefox Home Content ***/
user_pref("browser.newtabpage.activity-stream.showSponsored", false); // [FF58+] Pocket > Sponsored Stories
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false); // [FF83+] Sponsored shortcuts
/* clear default topsites
 * [NOTE] This does not block you from adding your own ***/
user_pref("browser.newtabpage.activity-stream.default.sites", "");

/*** QUIETER FOX ***/

/* disable recommendation pane in about:addons (uses Google Analytics) ***/
user_pref("extensions.getAddons.showPane", false); // [HIDDEN PREF]
/* recommendations in about:addons' Extensions and Themes panes [FF68+] ***/
user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);
/* personalized Extension Recommendations in about:addons and AMO [FF65+]
 * https://support.mozilla.org/kb/personalized-extension-recommendations ***/
user_pref("browser.discovery.enabled", false);

/** TELEMETRY ***/

/* disable new data submission */
user_pref("datareporting.policy.dataSubmissionEnabled", false);
/* disable Health Reports */
user_pref("datareporting.healthreport.uploadEnabled", false);
/* 0332: disable telemetry */
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.server", "data:,");
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("toolkit.telemetry.newProfilePing.enabled", false);
user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);
user_pref("toolkit.telemetry.updatePing.enabled", false);
user_pref("toolkit.telemetry.bhrPing.enabled", false);
user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);
/* disable Telemetry Coverage */
user_pref("toolkit.telemetry.coverage.opt-out", true); // [HIDDEN PREF]
user_pref("toolkit.coverage.opt-out", true); // [FF64+] [HIDDEN PREF]
user_pref("toolkit.coverage.endpoint.base", "");
/* disable PingCentre telemetry (used in several System Add-ons) [FF57+] */
user_pref("browser.ping-centre.telemetry", false);
/* disable Firefox Home (Activity Stream) telemetry ***/
user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
user_pref("browser.newtabpage.activity-stream.telemetry", false);
user_pref("toolkit.telemetry.reportingpolicy.firstRun", false);
user_pref("toolkit.telemetry.shutdownPingSender.enabledFirstsession", false);

/** STUDIES ***/

/* disable Studies ***/
user_pref("app.shield.optoutstudies.enabled", false);
/* disable Normandy/Shield [FF60+]
 * Shield is a telemetry system that can push and test "recipes" ***/
user_pref("app.normandy.enabled", false);
user_pref("app.normandy.api_url", "");

/** CRASH REPORTS ***/

/* disable Crash Reports ***/
user_pref("breakpad.reportURL", "");
user_pref("browser.tabs.crashReporting.sendReport", false);
/* enforce no submission of backlogged Crash Reports [FF58+]
 * [SETTING] Privacy & Security>Firefox Data Collection & Use>Allow Firefox to send backlogged crash reports  ***/
user_pref("browser.crashReports.unsubmittedCheck.autoSubmit2", false);

/** OTHER ***/

/* 0360: disable Captive Portal detection
 * [1] https://www.eff.org/deeplinks/2017/08/how-captive-portals-interfere-wireless-security-and-privacy ***/
user_pref("captivedetect.canonicalURL", "");
user_pref("network.captive-portal-service.enabled", false);
/* disable Network Connectivity checks
 * [1] https://bugzilla.mozilla.org/1460537 ***/
user_pref("network.connectivity-service.enabled", false);

/*** [GEOLOCATION / LANGUAGE / LOCALE ***/

/* use Mozilla geolocation service instead of Google.*/
user_pref("geo.provider.network.url", "https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%");
/* disable using the OS's geolocation service ***/
user_pref("geo.provider.ms-windows-location", false); // [WINDOWS]
user_pref("geo.provider.use_corelocation", false); // [MAC]
user_pref("geo.provider.use_gpsd", false); // [LINUX]
user_pref("geo.provider.use_geoclue", false); // [FF102+] [LINUX]


// Integrated calculator at urlbar
user_pref("browser.urlbar.suggest.calculator", true);
