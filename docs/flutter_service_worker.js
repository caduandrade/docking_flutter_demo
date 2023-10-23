'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"canvaskit/canvaskit.js": "bbf39143dfd758d8d847453b120c8ebb",
"canvaskit/canvaskit.wasm": "19d8b35640d13140fe4e6f3b8d450f04",
"canvaskit/chromium/canvaskit.js": "96ae916cd2d1b7320fff853ee22aebb0",
"canvaskit/chromium/canvaskit.wasm": "1165572f59d51e963a5bf9bdda61e39b",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/skwasm.wasm": "d1fde2560be92c0b07ad9cf9acb10d05",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"main.dart.js": "8472fbfa051330fbc68ef15fb7b69580",
"version.json": "0d72dad59da1ef1fc5a84b033d96f435",
"assets/lib/examples/keep_alive.dart": "12e8a8f4106810cebf9df0188eef07df",
"assets/lib/examples/child_builder_mixin.dart": "1b654a4d598551e22bd54a8ef5cf1fbd",
"assets/lib/examples/buttons_builder.dart": "e2613e660c663c88bc4607e0ed9443c9",
"assets/lib/examples/item/non_closable.dart": "cecc0ab7c7f779a85ab439e83c041e64",
"assets/lib/examples/item/selection_listener.dart": "3286da4de75eb8099108f2622604441a",
"assets/lib/examples/item/close_listener.dart": "e7022bba8afb9582b237b85133899e7f",
"assets/lib/examples/item/close_interceptor.dart": "104d3b9ab34cd9285353f3d36175c23f",
"assets/lib/examples/item/item_buttons.dart": "d5bcfce31416015d63ececf00656546b",
"assets/lib/examples/item/non_maximizable.dart": "17d477af6dd0b75e7d5fcfecb01350e5",
"assets/lib/examples/item/item_leading.dart": "c402767106d0394d6e2ac3d7d84b3a55",
"assets/lib/examples/item/changing_item.dart": "0969706765816688f78f38f1fd27f592",
"assets/lib/examples/layout/layout_c.dart": "49d229d5e94cd0aaa81c45469cee60d6",
"assets/lib/examples/layout/layout_r.dart": "2bc3fb73db67453fa826a66d74296241",
"assets/lib/examples/layout/layout_rc.dart": "020b22bbfefbf598d6626319a9f0eaad",
"assets/lib/examples/layout/layout_rcr.dart": "0d430399b8e1b84fa8548a22b5c921ae",
"assets/lib/examples/layout/layout_rct.dart": "c24e97fa4d02fae5374c3da58a76b347",
"assets/lib/examples/layout/layout_t.dart": "5b64d12277459ce45ff8bbea92ac59ff",
"assets/lib/examples/layout/remove_by_id.dart": "651ad90f2efd9be09dcd822ad4fdb876",
"assets/lib/examples/layout/save_load.dart": "ce70d122068cb80905b67ad0f08fd6a5",
"assets/lib/examples/layout/stringify_custom_id.dart": "ba510ae1f57740a216345dddba669c59",
"assets/lib/examples/theme/tabs_theme.dart": "3399a8344008ab292d16bdbdd399b649",
"assets/lib/examples/theme/divider_theme.dart": "341dbdc54139bb889e213247d9a6e822",
"assets/lib/examples/theme/hide_tabs_area_theme.dart": "b65f9470bcbcaf2bfd3afaf4e239b322",
"assets/lib/examples/size/minimal_size.dart": "4b635a7af1e363808120894dbb2d435b",
"assets/lib/examples/size/initial_size.dart": "d18f0d7c646057ff9d05f1ea05dd8e81",
"assets/lib/examples/size/initial_weight.dart": "6524790574b54d1af507f323724b0000",
"assets/packages/flex_color_picker/assets/opacity.png": "49c4f3bcb1b25364bb4c255edcaaf5b2",
"assets/fonts/MaterialIcons-Regular.otf": "f113fac934aa8d1d929d46d9d1f0a3de",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/AssetManifest.json": "f656a6a34f95fa3bbd3f9bdfb3ddfc9d",
"assets/AssetManifest.bin": "37a676da102b9a3a913a43eeca489195",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/NOTICES": "0959b0e9536b23875466997e7d70b4c0",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "ed83c42eb21c36860378dc53e8998a14",
"/": "ed83c42eb21c36860378dc53e8998a14",
"manifest.json": "257c96018b8ad180c605d8a04ba49ee0",
"ripple.gif": "4c21c31ea4ba058b6b232acf4130b62a"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
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
