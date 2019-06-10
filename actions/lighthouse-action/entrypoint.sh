#!/bin/sh

set -e

sh -c "npm start & node /wait-for-server.js && lighthouse --chrome-flags='--headless --disable-gpu' --output=json --output-path=./report.json http://localhost:$PORT $*"
sh -c "node /validate-report.js ./report.json"