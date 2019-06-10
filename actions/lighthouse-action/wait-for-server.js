const http = require('http')

const SERVER_URL = `http://localhost:${process.env.PORT}`
const MAX_ATTEMPTS = 20

const ping = () =>
  new Promise((resolve, reject) =>
    http.get(SERVER_URL, resolve).on('error', reject)
  )

const sleep = time => new Promise(resolve => setTimeout(resolve, time))

const waitServer = (retryAttempt = 0) =>
  retryAttempt < MAX_ATTEMPTS
    ? ping().catch(() => sleep(1000).then(() => waitServer(retryAttempt + 1)))
    : Promise.reject()

waitServer()
  .then(() => console.log(`Server alive at ${SERVER_URL}! Continuing...`))
  .catch(() => {
    console.error(`Server not reachable at ${SERVER_URL}`)
    process.exit(1)
  })
