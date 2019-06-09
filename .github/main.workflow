workflow "Masochist" {
  on = "pull_request"
  resolves = ["Vulnerability Scan", "Scan package.json for updateable packages", "Run linters"]
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

action "Run linters" {
  uses = "actions/npm@v2.0.0"
  needs = "Install Dependencies"
  args = "run-script lint"
}