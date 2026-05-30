variable "do_token" {
  description = "DigitalOcean API token"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "DigitalOcean region"
  type        = string
  default     = "nyc1"
}

variable "ssh_key_fingerprint" {
  description = "Fingerprint of the SSH key added to your DigitalOcean account"
  type        = string
}
