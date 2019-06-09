workflow "Validate Licenses" {
  on = "push"
  resolves = "Check NPM Licenses"
}

action "Check NPM Licenses" {
  uses = "actions/licensed/node@v1.0.0"
  args = "status"
}