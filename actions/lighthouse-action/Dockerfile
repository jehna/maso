FROM markadams/chromium-xvfb

LABEL version="1.0.0"

LABEL com.github.actions.name="Lighthouse"
LABEL com.github.actions.description="Runs lighthouse test suite against a website."
LABEL com.github.actions.icon="file-plus"
LABEL com.github.actions.color="purple"

# https://github.com/nodesource/distributions/blob/master/README.md#user-content-installation-instructions
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs

RUN npm install -g lighthouse

ENV PORT 5000
COPY "entrypoint.sh" "/entrypoint.sh"
COPY "validate-report.js" "/validate-report.js"
COPY "wait-for-server.js" "/wait-for-server.js"
ENTRYPOINT ["/entrypoint.sh"]
