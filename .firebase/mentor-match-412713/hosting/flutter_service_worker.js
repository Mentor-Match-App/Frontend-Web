'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "2fd2fbffa09c0fa352f43e72d78f0614",
"version.json": "ae4c83ad432f7717552e491d738cda4e",
"index.html": "8617275af665e81a350f834782c65bd1",
"/": "8617275af665e81a350f834782c65bd1",
"firebase-messaging-sw.js": "a9c653b21f11a8387f1b6ca20e4061f6",
"main.dart.js": "e09a59d203e9e0bf9de6568734918a98",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "e187aef7f0774724912aae807103b0ea",
"assets/AssetManifest.json": "06cdeada2d34c1ab43b9a993a7a60c4a",
"assets/NOTICES": "0d00ea3b7c980207dbbc8aa3af681313",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "e882d1ad4ce1352922db851d8753efc6",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "01b750731a7fcb512692d58de5f3fcb2",
"assets/fonts/MaterialIcons-Regular.otf": "d72adbd5f4ee1c2ace6b4b0dc5773c32",
"assets/assets/blank_profile.jpg": "d75b056f3b2f7ff7338a2ddd4054c9f3",
"assets/assets/component-3.png": "95b1555eefdec4f950c594f085d79f7b",
"assets/assets/component-2.png": "215ad54a1a6ca1abe52d6d2bd1c52a8a",
"assets/assets/component-1.png": "ea223f2bdd07a7f131137970f5e44297",
"assets/assets/Handoff/ilustrator/choose_role.png": "883d9e5ca2fedfd9f93be5484b2e45ff",
"assets/assets/Handoff/ilustrator/verification.png": "22a32bc2bfbe874cc9d81abbeb3208f5",
"assets/assets/Handoff/ilustrator/teacher.png": "e1d25248971054ee2e0b1dc36dee7818",
"assets/assets/Handoff/ilustrator/login.png": "8632282d9f40c059da7a4ca801cd1d45",
"assets/assets/Handoff/ilustrator/question.png": "f1050308eab96601a9f8cd7fafbc7f7b",
"assets/assets/Handoff/ilustrator/mentee_role.png": "9b2ff0a2774f9640ae6ff8cfb0c93ff7",
"assets/assets/Handoff/ilustrator/review.png": "f617553d6b6bc1dff0ee617dbba69a53",
"assets/assets/Handoff/ilustrator/Sessiongratisteacher.png": "b16bdc4b9accc7c9ba1b90f7a6d49d92",
"assets/assets/Handoff/ilustrator/community.png": "3e9be91370015b4a2b96ca7ffd3918f5",
"assets/assets/Handoff/ilustrator/payment-gagal.png": "3df41d2e14e8102d39b2f4cd3b026cd9",
"assets/assets/Handoff/ilustrator/error.png": "512f27e1f196ab62392ac8cc6616ba0a",
"assets/assets/Handoff/ilustrator/mentor_role.png": "d24867d27b7afe3b92ae8255482b7621",
"assets/assets/Handoff/ilustrator/Premiumclassverified.png": "77f2e37c6f03767af1b520f34ae4b3ea",
"assets/assets/Handoff/ilustrator/profile.png": "afc6179abd75cad5c88af486235a98e1",
"assets/assets/Handoff/ilustrator/mentor_in_zoom.png": "16d36cda2b342f769cd6e88d321edae2",
"assets/assets/Handoff/ilustrator/looking_mentor.png": "da7c55800183e04a949320028e57defe",
"assets/assets/Handoff/ilustrator/succes.png": "7e673ce6f8bcedc9bb5903fd82eac57d",
"assets/assets/Handoff/ilustrator/learn_together.png": "a27af65f3caf0c4b24356049a6fb0161",
"assets/assets/Handoff/ilustrator/learn_by_online.png": "dce637738b1106a71d9138e3a616c56c",
"assets/assets/Handoff/ilustrator/first_screen.png": "67be532a6a3b95e79c54a3bd1aaed4a5",
"assets/assets/Handoff/ilustrator/learn_together_2.png": "3eeb3cd0039a83256a1c5982bb71cd06",
"assets/assets/Handoff/education_level/SMA.png": "886c3650d029eaca302b8a634a457161",
"assets/assets/Handoff/education_level/SMP.png": "7db5a51328efa30a6c10940f6e96c464",
"assets/assets/Handoff/education_level/SD.png": "e97055aae5675d7375c4296c531e5e25",
"assets/assets/Handoff/education_level/KARIER.png": "db6ca17f30e9bc5e40d51ab2a31c8d21",
"assets/assets/Handoff/education_level/KULIAH.png": "c7980894a5e7cc363cf460f04a9ef0f2",
"assets/assets/Handoff/community.png": "a07dfac058c5ec2b1ff8d00032817bbb",
"assets/assets/Handoff/payment.png": "fc5b0de249dac624e2eb984f906491f6",
"assets/assets/Handoff/communityLogo/Python.png": "edbc0e379e448e22c7cadd358f069caa",
"assets/assets/Handoff/communityLogo/Flutter.png": "bd272fc693bfdafa4c6548a97bd93af8",
"assets/assets/Handoff/communityLogo/UIUX.png": "ac54e30888761868c8934672b1710e42",
"assets/assets/Handoff/communityLogo/JS.png": "ad588a8de0ae2b35fc2de1b8ecafe736",
"assets/assets/Handoff/communityLogo/HTMLCSS.png": "0c0a00bbe7c50fcbaee4155e3d5cf59d",
"assets/assets/Handoff/communityLogo/AddCommunity.png": "fdbd89f2951f03a6abd3c7d6bb44e49d",
"assets/assets/Handoff/communityLogo/Kotlin.png": "f7874f30d257b13651a938168a9c2bdf",
"assets/assets/Handoff/logo/LogoMobile.png": "f16d200f8714096a2417906af0c4fec1",
"assets/assets/Handoff/logo/LogoWeb.png": "03183e342e64796694b5b4b01f860e0c",
"assets/assets/Handoff/icon/MyClass/review_icon.png": "fb5a0cf36b87dcbdca91be7ad57d493c",
"assets/assets/Handoff/icon/MyClass/materi_icon.png": "125891c8a4360341a4473ada01b8645c",
"assets/assets/Handoff/icon/MyClass/evaluasi_icon.png": "d749fdb475e5852c41bf9cf0670d8d4d",
"assets/assets/Handoff/icon/MyClass/meeting_icon.png": "1f306fbb85ee01b74cb96358f9da0603",
"assets/assets/Handoff/icon/social-icons/instagram.png": "849fac82e34ae14ded927a56cf5ea1d3",
"assets/assets/Handoff/icon/social-icons/behance.png": "158e51984f895bb077cb176bb37a98ad",
"assets/assets/Handoff/icon/social-icons/twitter.png": "6a141c25cf63b37bf7a69e625d661385",
"assets/assets/Handoff/icon/social-icons/linkedin.png": "386b9216c3a34a99009ba308b1a88ab9",
"assets/assets/Handoff/icon/social-icons/whatsapp.png": "51df5b0b0aa7ade2a89748b35031d835",
"assets/assets/Handoff/icon/adminIcon/Mentor.png": "327f1c8cc3f72fcd21d1b288ff578247",
"assets/assets/Handoff/icon/adminIcon/Premium%2520Class.png": "bff822c1fb20c45adb2e3c4a4ab0fb06",
"assets/assets/Handoff/icon/adminIcon/Community.png": "b614d02a03c4181a31340c7fba999e8f",
"assets/assets/Handoff/icon/adminIcon/Mentee.png": "d7c1a23808347c88aba2bfc9a763efd0",
"assets/assets/Handoff/icon/adminIcon/Payment.png": "51bac693ae9527615205a4ea51da5820",
"assets/assets/Handoff/icon/categoryIcon/Karier/Security_Engineer.png": "41446f0d8441f45fc1f98e8d929737f3",
"assets/assets/Handoff/icon/categoryIcon/Karier/design.png": "b9f013b35f93ea0d4cd6b2ec628b97bf",
"assets/assets/Handoff/icon/categoryIcon/Karier/data_analys.png": "c03388adc589afd360e0850058f60e04",
"assets/assets/Handoff/icon/categoryIcon/Karier/all.png": "f53b450c96c73fa376f58a18ab3e9ed8",
"assets/assets/Handoff/icon/categoryIcon/Karier/Quality_Assurance.png": "06fd0845cb57293b00f1114abae6b737",
"assets/assets/Handoff/icon/categoryIcon/Karier/Back_End.png": "aa5ea3cf931822e69462d6f0548ef179",
"assets/assets/Handoff/icon/categoryIcon/Karier/marketing.png": "0867b9512f1c2f19c3f3ea73003d0f63",
"assets/assets/Handoff/icon/categoryIcon/Karier/Front_End.png": "b2afcffca91bf05f2b17e4adc7bc8021",
"assets/assets/Handoff/icon/categoryIcon/Karier/finance.png": "785dd4631c1bcc23a9bc4c253531a688",
"assets/assets/Handoff/icon/categoryIcon/SD/Pengetahuan.jpg": "25fe3bc9ecb85b358f66a65c401e97d1",
"assets/assets/Handoff/icon/categoryIcon/SD/all.png": "f53b450c96c73fa376f58a18ab3e9ed8",
"assets/assets/Handoff/icon/categoryIcon/SD/Sastra_Bahasa.png": "ee51246770352c042b5e33af2e162eec",
"assets/assets/Handoff/icon/categoryIcon/SD/math.png": "888a9d683380bf55745f2ed10658769c",
"assets/assets/Handoff/icon/categoryIcon/SD/tech.png": "35b1522ec24820dac9b04ce144d95055",
"assets/assets/Handoff/icon/categoryIcon/SMA/all.png": "f53b450c96c73fa376f58a18ab3e9ed8",
"assets/assets/Handoff/icon/categoryIcon/SMA/bilogy.png": "fd4a514be19256f8f600d206466ebcb5",
"assets/assets/Handoff/icon/categoryIcon/SMA/Sastra_Bahasa.png": "ee51246770352c042b5e33af2e162eec",
"assets/assets/Handoff/icon/categoryIcon/SMA/math.png": "888a9d683380bf55745f2ed10658769c",
"assets/assets/Handoff/icon/categoryIcon/SMA/fisika.png": "5e2a2bde5c35568d6ad884bc1abeab80",
"assets/assets/Handoff/icon/categoryIcon/SMA/economi.png": "4ad5ba72c094503e4a888a9862181876",
"assets/assets/Handoff/icon/categoryIcon/SMA/geografi.png": "02c0be0129b75c8b179f8574d49179b8",
"assets/assets/Handoff/icon/categoryIcon/SMA/kimia.png": "39b572d89651342581f66d17f9ef719e",
"assets/assets/Handoff/icon/categoryIcon/SMA/tech.png": "35b1522ec24820dac9b04ce144d95055",
"assets/assets/Handoff/icon/categoryIcon/SMP/all.png": "f53b450c96c73fa376f58a18ab3e9ed8",
"assets/assets/Handoff/icon/categoryIcon/SMP/bilogy.png": "fd4a514be19256f8f600d206466ebcb5",
"assets/assets/Handoff/icon/categoryIcon/SMP/Sastra_Bahasa.png": "ee51246770352c042b5e33af2e162eec",
"assets/assets/Handoff/icon/categoryIcon/SMP/math.png": "888a9d683380bf55745f2ed10658769c",
"assets/assets/Handoff/icon/categoryIcon/SMP/fisika.png": "5e2a2bde5c35568d6ad884bc1abeab80",
"assets/assets/Handoff/icon/categoryIcon/SMP/economi.png": "4ad5ba72c094503e4a888a9862181876",
"assets/assets/Handoff/icon/categoryIcon/SMP/geografi.png": "02c0be0129b75c8b179f8574d49179b8",
"assets/assets/Handoff/icon/categoryIcon/SMP/kimia.png": "39b572d89651342581f66d17f9ef719e",
"assets/assets/Handoff/icon/categoryIcon/SMP/tech.png": "35b1522ec24820dac9b04ce144d95055",
"assets/assets/Handoff/icon/categoryIcon/Kuliah/design.png": "b9f013b35f93ea0d4cd6b2ec628b97bf",
"assets/assets/Handoff/icon/categoryIcon/Kuliah/psikolog.png": "e26d9fdae32ce4265e54378d46534135",
"assets/assets/Handoff/icon/categoryIcon/Kuliah/teacher.png": "77226907c81efba89f9b2a5e58a6b9fd",
"assets/assets/Handoff/icon/categoryIcon/Kuliah/all.png": "f53b450c96c73fa376f58a18ab3e9ed8",
"assets/assets/Handoff/icon/categoryIcon/Kuliah/Information.png": "55743a2c2dfafe2f26450ddb65ae5698",
"assets/assets/Handoff/icon/categoryIcon/Kuliah/Computer_Scince.png": "04e82edf1880b5611d7eb9b60076717b",
"assets/assets/Handoff/icon/categoryIcon/Kuliah/electro.png": "5f9be229af76614193be5e0f529643e2",
"assets/assets/Handoff/icon/categoryIcon/Kuliah/manajemen.png": "aa67b8014f0d1ea8f563cf4a4b929955",
"assets/assets/Handoff/icon/categoryIcon/Kuliah/Sastra%2520Bahasa.png": "ee51246770352c042b5e33af2e162eec",
"assets/assets/Handoff/icon/categoryIcon/Kuliah/ilkon.png": "7e4edb66449352e803548f7d8ad67601",
"assets/assets/logo-1.png": "f5fa306dedd336374cd34d9849845ce6",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
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
