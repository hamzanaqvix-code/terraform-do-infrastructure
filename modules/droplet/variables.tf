variable "name" {
  description = "Name of the droplet"
  type        = string
}

variable "region" {
  description = "DigitalOcean region"
  type        = string
}

variable "size" {
  description = "Droplet size slug"
  type        = string
  default     = "s-1vcpu-1gb"
}

variable "image" {
  description = "Droplet image"
  type        = string
  default     = "debian-12-x64"
}

variable "ssh_key_fingerprint" {
  description = "SSH key fingerprint"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the droplet"
  type        = list(string)
  default     = []
}

variable "user_data" {
  description = "Cloud-init user data script"
  type        = string
  default     = ""
}
