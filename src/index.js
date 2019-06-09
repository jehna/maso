const http = require('http')
const fs = require('fs')
const path = require('path')

const PUBLIC_DIR = path.join(__dirname, '../public')

const parseUrl = request => {
  const { dir, base } = path.parse(request.url)
  return path.join(dir, base || 'index.html')
}

const server = http.createServer((request, response) => {
  const targetFilePath = path.join(PUBLIC_DIR, parseUrl(request))
  if (fs.existsSync(targetFilePath)) {
    response.writeHead(200)
    fs.createReadStream(targetFilePath).pipe(response)
  } else {
    response.writeHead(404)
    response.end('Not found')
  }
})

server.listen(process.env.PORT || 8000)
