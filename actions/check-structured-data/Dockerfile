FROM node:12

LABEL version="1.0.0"

LABEL com.github.actions.name="Structured data test"
LABEL com.github.actions.description="Checks that structured data is being implemented on a website"
LABEL com.github.actions.icon="grid"
LABEL com.github.actions.color="purple"

RUN npm i -g web-auto-extractor

COPY "entrypoint.sh" "/entrypoint.sh"
COPY "wait-for-server.js" "/wait-for-server.js"
COPY "check-microdata.js" "/check-microdta.js"
ENTRYPOINT ["/entrypoint.sh"]