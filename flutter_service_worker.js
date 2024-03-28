'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"index.html": "f5e8032e558929ca6a172664306bcfc7",
"/": "f5e8032e558929ca6a172664306bcfc7",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "cd01bdfa5929a12597189a4d8d3d60cb",
"assets/AssetManifest.bin.json": "e48fe55657776bf35e2edcaaa78b64c1",
"assets/assets/avatars/avatar4.svg": "d75977670b21eaf5870886c383bd22d4",
"assets/assets/avatars/avatar2.svg": "783058395cf40163aaa60ddd3e2d9fc8",
"assets/assets/avatars/avatar5.svg": "121176096fccacd36bab3cd9a23f537f",
"assets/assets/avatars/avatar3.svg": "f0c7d77b31ebe6ca3900ad008d230d03",
"assets/assets/animations/seeking-development.json": "0a0f6ef78aecbccfde29a898a1f0bfe5",
"assets/assets/animations/KYB.json": "26439a7300e7fdf3fc80026dab836b5f",
"assets/assets/icons/add.svg": "03414017acdaa6730c629b2b4f76c237",
"assets/assets/icons/entries.svg": "b3ef5f26d7ee26cbfc857df626c56ca4",
"assets/assets/icons/bell.svg": "1562fcfb9d4562d0e5181e3c4615a675",
"assets/assets/icons/points.svg": "966a12c0b7d132f3e847d16942ff7b66",
"assets/assets/icons/learn.svg": "eb6946f4edba4430709289f1e8c36ee3",
"assets/assets/icons/journall.svg": "3dbaf9d1fe11fbe6c77ad0bcdfb863c2",
"assets/assets/icons/home.svg": "2d457883a9ba86ce93323e318c8078f5",
"assets/assets/icons/more.svg": "63e798c0c20f3c794e6af7b8d227c7da",
"assets/assets/icons/myspace.svg": "57e5a494d88b290d8fc787a7774c9ac2",
"assets/assets/icons/assess.svg": "3f7f223930b6de61144de53f81f9446e",
"assets/assets/icons/analysis.svg": "f4bc77e8f38b9ede853c534a52a4efd5",
"assets/assets/icons/close.svg": "c139ada97eb06dfa02331f8519b35ddc",
"assets/assets/illustrations/health10.svg": "918abdc3eac546f8b3c77c44555273eb",
"assets/assets/illustrations/emotional.svg": "272d89584216eac69ee2c8eaed849696",
"assets/assets/illustrations/spiritual.svg": "515021af728db7c50f45293ae5c9feac",
"assets/assets/illustrations/health1.svg": "c189cd57f6b8ee7010434a7a13a23ab9",
"assets/assets/illustrations/health15.svg": "cb27a7980b88ce90df3dfa88b011b7ee",
"assets/assets/illustrations/health16.svg": "64adead602c5bcb00a2c2cc3c6b497ed",
"assets/assets/illustrations/health7.svg": "ff736f4bb8862419330db2a156c71036",
"assets/assets/illustrations/health4.svg": "281d7d8bea18f9a25b5507a1c2bb912e",
"assets/assets/illustrations/health14.svg": "896c39268ecc2272616aed7d070a2385",
"assets/assets/illustrations/health13.svg": "f99c00cb82bb715e5fb8585355085e4f",
"assets/assets/illustrations/physical.svg": "753421a941eece7fe14a58461f344fba",
"assets/assets/illustrations/health3.svg": "3fd5134e651174fc5094379a6b5c90e1",
"assets/assets/illustrations/health19.svg": "025b12ba1df60afa41378f4b61a9451c",
"assets/assets/illustrations/health9.svg": "c6bcd502a7cf0c39ad0cfba3ac455759",
"assets/assets/illustrations/onboard3.svg": "2abde708e96e89977be25d624cf355ca",
"assets/assets/illustrations/milestones.svg": "3470a712136b3466935333506f7b6e57",
"assets/assets/illustrations/onboard2.svg": "8612196d2fade941c314f5b457f5685a",
"assets/assets/illustrations/onboard1.svg": "0bfe526b6fbdeebb6441d5fdb6a5c3df",
"assets/assets/illustrations/health11.svg": "a57b8383b7676d4523f4664206d77289",
"assets/assets/illustrations/health18.svg": "319f7e1e49cf1d351f67564fb36149f1",
"assets/assets/illustrations/health5.svg": "bba0fa200e6f0e5d1f79f98f87e8b602",
"assets/assets/illustrations/health17.svg": "a39d50213e08b6776307c3e9191a7b38",
"assets/assets/illustrations/health12.svg": "c077555928b79d19c8ef183f71e4cd3e",
"assets/assets/illustrations/health2.svg": "b15b2746634f568bf4835543a033d9c1",
"assets/assets/illustrations/health8.svg": "78de83ba5c42bcf372a7bd822449219c",
"assets/assets/illustrations/fit.png": "6757cdf408552d9b962f7b046fad0842",
"assets/assets/illustrations/activity.png": "720c69b05c63becf586ea2760b03b10f",
"assets/assets/illustrations/health6.svg": "30dfc110ed26a60746b94c700ca9d680",
"assets/assets/illustrations/mental.svg": "0b0186a673dad63448216c2aadd5c356",
"assets/assets/emojis/joyful.svg": "51665178ecf64ba27b514d5e96bdf3e0",
"assets/assets/emojis/angry.svg": "89e816f3c74fb636875fef6640ef5ffb",
"assets/assets/emojis/happy.svg": "a73ac1872824fe8cf25b2623b1e7c3bc",
"assets/assets/emojis/amazed.svg": "6d685ab222bf7d699c154b80cd110b37",
"assets/assets/emojis/sad.svg": "b85db91a8d69ed751a6f672d27a49c7d",
"assets/assets/emojis/loving.svg": "ad50a4187a39fcf56e511818738c7412",
"assets/assets/emojis/neutral.svg": "fd0224c536011749100f60b19403c7ea",
"assets/assets/emojis/party.svg": "84f337a70631a8a2a422b1b29a07b89e",
"assets/assets/brand/sailcc.png": "d1018d46d1f959719bc40eb5fd7055ef",
"assets/assets/brand/google.svg": "324c3c17d42e117359efc915417a3c65",
"assets/assets/brand/kyb.svg": "8138c0de2b4e8c8339034ae98e2f67f0",
"assets/AssetManifest.bin": "3a4c3f841a1e9da248aeb268f7539f66",
"assets/NOTICES": "d39d778166ba78abe65e4738712087a2",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/packages/awesome_notifications/test/assets/images/test_image.png": "c27a71ab4008c83eba9b554775aa12ca",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "99e708f58c03ad8cc46732cdc1366fd5",
"assets/packages/flutter_sound_web/src/flutter_sound_player.js": "6bf84579813fd481ec5e24e73927500d",
"assets/packages/flutter_sound_web/src/flutter_sound_recorder.js": "f7ac74c4e0fd5cd472d86c3fe93883fc",
"assets/packages/flutter_sound_web/src/flutter_sound.js": "aecd83c80bf4faace0bcea4cd47ab307",
"assets/packages/flutter_sound_web/howler/howler.js": "2bba823e6b4d71ea019d81d384672823",
"assets/AssetManifest.json": "5f279aefa794066b2a33642f32f2b269",
"version.json": "49c978aa6565d43fe3ac8a8bc534aca0",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"manifest.json": "251b719669474869228b2210ef0091ed",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"main.dart.js": "67b357d23013c3f08cad05564ac469c7"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
