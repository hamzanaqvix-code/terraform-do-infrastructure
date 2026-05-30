variable "do_token" {
  description = "DigitalOcean API token"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "DigitalOcean region slug"
  type        = string
  default     = "nyc1"
}

variable "project_name" {
  description = "Project name used for naming resources"
  type        = string
  default     = "hamza-infra"
}

variable "droplet_size" {
  description = "Droplet size slug"
  type        = string
  default     = "s-1vcpu-1gb"
}

variable "ssh_key_fingerprint" {
  description = "Fingerprint of SSH key in your DigitalOcean account"
  type        = string
}
