variable "digitalocean_region" {
  type        = string
  description = "Region for DigitalOcean resources"
  default     = "sgp1" # Singapore
}

variable "digitalocean_droplet_image" {
  type        = string
  description = "DigitalOcean Droplet instance image"
  default     = "ubuntu-22-04-x64"
}

variable "digitalocean_droplet_name" {
  type        = string
  description = "DigitalOcean Droplet instance name"
  default     = "ubuntu-s-1vcpu-512mb-10gb-sgp1-01"
}

variable "digitalocean_droplet_size" {
  type        = string
  description = "DigitalOcean Droplet instance size"
  default     = "s-1vcpu-512mb-10gb"
}

variable "digitalocean_tags" {
  type    = list(string)
  default = ["buildkite", "throwaway"]
}

variable "buildkite_agent_name" {
  type        = string
  description = "BuildKite agent instance name"
  default     = "SHIBUYA-85"
}

variable "buildkite_agent_tags" {
  type        = string
  description = "BuildKite agent instance tags"
  default     = "ci=true,linux=true,source=digitalocean"
}

variable "digitalocean_droplet_script_template" {
  type        = string
  description = "location of droplet script template"
  default     = "scripts/tmpl/buildkite_ubuntu.yaml"
}
