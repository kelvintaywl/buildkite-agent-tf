# buildkite-agent-tf

Terraforming a BuildKite Agent via a DigitalOcean droplet.

## Prerequisites

- DigitalOcean account
- Terraform >= v1.4.0

## Required credentials

- Buildkite (assumed BUILDKITE_API_TOKEN env var is set)
- DigitalOcean (assumed DIGITALOCEAN_TOKEN env var is set)

## Notes

Somehow, the user_data loaded for digitalocean_droplet is somehow not running.
I am unsure if this is due to input error (invalid cloud-init yaml), or perhaps a provider issue.

I ended up running the same steps manually inside the created Droplet.
