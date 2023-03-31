locals {
  pipeline_yaml = "scripts/steps.yml"
  repo          = "whale-of-a-time-buildkite"
}

data "github_repository" "gh_repo_whale" {
  name = local.repo
}

resource "buildkite_pipeline" "buildkite_pipeline_whale" {
  name        = "whale of a time (via TF)"
  description = "Whale of a time repo modified for Buildkite"
  # public repo; can use HTTP
  repository     = data.github_repository.gh_repo_whale.http_clone_url
  steps          = file("${path.module}/${local.pipeline_yaml}")
  default_branch = data.github_repository.gh_repo_whale.default_branch
}

resource "github_repository_webhook" "gh_repo_webhook_buildkite" {
  repository = local.repo

  configuration {
    url          = buildkite_pipeline.buildkite_pipeline_whale.webhook_url
    content_type = "json"
    insecure_ssl = false
  }

  active = true

  events = [
    "deployment",
    "push",
    "pull_request",
  ]
}


