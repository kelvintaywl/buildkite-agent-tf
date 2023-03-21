resource "buildkite_agent_token" "buildkite_agent_token_1" {
  description = "https://circleci.atlassian.net/browse/SHIBUYA-85"
}

resource "digitalocean_ssh_key" "personal_macbook_air" {
  name       = "Personal MacBook Air"
  public_key = file("/Users/kelvintaywl/.ssh/id_ed25519.pub")
}

resource "digitalocean_droplet" "sgp1_small_ubuntu2204" {
  image    = var.digitalocean_droplet_image
  name     = var.digitalocean_droplet_name
  region   = var.digitalocean_region
  size     = var.digitalocean_droplet_size
  tags     = var.digitalocean_tags
  ssh_keys = [digitalocean_ssh_key.personal_macbook_air.fingerprint]
  user_data = base64encode(templatefile(
    "${path.module}/${var.digitalocean_droplet_script_template}",
    {
      token = buildkite_agent_token.buildkite_agent_token_1.token
      name  = var.buildkite_agent_name
      tags  = var.buildkite_agent_tags
    }
  ))
}
