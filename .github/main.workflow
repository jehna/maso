
workflow "Scan PR for vulnerable dependencies" {
  on = "pull_request"
  resolves = ["Vulnerability Scan"]
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