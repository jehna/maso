const FILES_TO_CACHE = ['/index.html']

evt.waitUntil(
  caches.open(CACHE_NAME).then(cache => {
    return cache.addAll(FILES_TO_CACHE)
  })
)

evt.waitUntil(
  caches.keys().then(keyList => {
    return Promise.all(
      keyList.map(key => {
        if (key !== CACHE_NAME) {
          return caches.delete(key)
        }
      })
    )
  })
)
