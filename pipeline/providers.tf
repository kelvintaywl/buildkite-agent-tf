terraform {
  required_providers {
    buildkite = {
      source  = "buildkite/buildkite"
      version = "0.12.2"
    }
    github = {
      source  = "integrations/github"
      version = "5.18.3"
    }
  }
}

provider "buildkite" {
  # Assumes BUILDKITE_API_TOKEN env var set
  organization = "kelvintaywl"
}

provider "github" {
  # Configuration options
  owner = "kelvintaywl-cci"
}
