terraform {
  required_version = "~> 1.4.0"
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.26.0"
    }
    buildkite = {
      source  = "buildkite/buildkite"
      version = "0.11.1"
    }
  }
}

provider "digitalocean" {
  # Assumes DIGITALOCEAN_TOKEN env var set
}

provider "buildkite" {
  # Assumes BUILDKITE_API_TOKEN env var set
  organization = "kelvintaywl"
}
