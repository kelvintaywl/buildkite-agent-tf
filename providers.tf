terraform {
  required_version = "~> 1.4.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.58.0"
    }
    buildkite = {
      source  = "buildkite/buildkite"
      version = "0.11.1"
    }
  }
}

provider "aws" {
  region = var.aws_region
  default_tags {
    tags = var.aws_tags
  }
}

provider "buildkite" {
  # Assumes BUILDKITE_API_TOKEN env var set
  organization = "kelvintaywl"
}
