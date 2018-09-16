// Modify Surfingkey settings

Hints.characters = 'asdfgqwertzxcvbyuiophjklnm'
settings.omnibarSuggestion = true
// currently not working
// settings.nextLinkRegex = '/((>>|next|nächst(.)*)+)/i'
// settings.prevLinkRegex = '/((<<|prev(ious)?|vorherig)+)/i'
addSearchAliasX('y', 'youtube', 'https://www.youtube.com/search?q=');

// Navigation
map('F', 'gf'); // open in new unactive tab
mapkey('p', "Open the clipboard's URL in the current tab", function() {
    Clipboard.read(function(response) {
        if (response.data.startsWith("http://") || response.data.startsWith("https://")) {
            window.location = response.data;
        } else {
            window.location = response.data = "https://www.google.com/search?q=" + response.data;
        }
    });
});
mapkey('P', 'Open link from clipboard', function() {
    Clipboard.read(function(response) {
        if (response.data.startsWith("http://") || response.data.startsWith("https://")) {
            tabOpenLink(response.data);
        } else {
            tabOpenLink("https://www.google.com/search?q=" + response.data);
        }
    });
});


// --- Site-specific mappings ---//
const siteleader = "\\";
const Hint = (selector, action = Hints.dispatchMouseClick) => () => Hints.create(selector, action);

function mapsitekey(domainRegex, key, desc, f, opts = {}) {
  const o = Object.assign({}, {
    leader: siteleader,
  }, opts);
  mapkey(`${o.leader}${key}`, desc, f, { domain: domainRegex });
}

function mapsitekeys(d, maps, opts = {}) {
  const domain = d.replace(".", "\\.");
  const domainRegex = new RegExp(`^http(s)?://(([a-zA-Z0-9-_]+\\.)*)(${domain})(/.*)?`);
  maps.forEach((map) => {
    const [
      key,
      desc,
      f,
      subOpts = {},
    ] = map;
    mapsitekey(domainRegex, key, desc, f, Object.assign({}, opts, subOpts));
  });
}

const ytFullscreen = () => document
  .querySelector(".ytp-fullscreen-button.ytp-button")
  .click();


mapsitekeys("youtube.com", [
  ["a", "Open video", Hint("*[id='video-title']")],
  ["c", "Open channel", Hint("*[id='byline']")],
  ["gh", "Goto homepage", () => window.location.assign("https://www.youtube.com/feed/subscriptions?flow=2")],
  ["f", "Toggle fullscreen", ytFullscreen],
  ["<Space>", "Play/pause", Hint(".ytp-play-button")],
], { leader: "" });

