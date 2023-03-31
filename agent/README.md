# buildkite-agent-tf

Terraforming a BuildKite Agent via an AWS EC2 instance

## Prerequisites

- AWS account
- Terraform >= v1.4.0

## Required credentials

- Buildkite (assumed BUILDKITE_API_TOKEN env var is set)
- AWS (assumed AWS credentials are already set; I am using [the `aws-vault` tool](https://github.com/99designs/aws-vault))
