workflow "Sadistic" {
  on = "pull_request"
  resolves = ["Vulnerability Scan", "Scan package.json for updateable packages", "Run strict linters", "Lighthouse 100/100"]
}

action "Install Dependencies" {
  uses = "actions/npm@v2.0.0"
  args = "ci"
}

action "Vulnerability Scan" {
  uses = "actions/vulnerability-scan@v1.0.0"
  needs = "Install Dependencies"
  env = {
    ECOSYSTEM = "npm"
    SEVERITY = "low"
  }
  secrets = ["GITHUB_TOKEN"]
}

action "Scan package.json for updateable packages" {
  uses = "actions/npm@v2.0.0"
  needs = "Install Dependencies"
  args = "outdated"
}

action "Run strict linters" {
  uses = "actions/npm@v2.0.0"
  needs = "Install Dependencies"
  args = "run-script lint"
}

action "Lighthouse 100/100" {
  uses = "./lighthouse-action/"
  needs = "Install Dependencies"
  args = "--skip-audits=uses-http2 --only-categories=performance,accessibility,best-practices,seo" # localhost https is not working properly (which would be required for http2)
}