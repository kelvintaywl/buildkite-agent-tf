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

variable "user_data_script_template" {
  type        = string
  description = "location of user_data script template"
  default     = "scripts/tmpl/buildkite_ubuntu.yaml"
}

variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "ap-northeast-1" # Tokyo, Japan
}

variable "aws_tags" {
  type        = map(any)
  description = "AWS resource tags"
  default = {
    team : "Support Engineering"
    owner : "kelvin@circleci.com"
    Name : "SHIBUYA-85-Buildkite-EC2"
  }
}
