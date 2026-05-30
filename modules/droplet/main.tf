terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

resource "digitalocean_droplet" "this" {
  name      = var.name
  region    = var.region
  size      = var.size
  image     = var.image
  ssh_keys  = [var.ssh_key_fingerprint]
  tags      = var.tags
  user_data = var.user_data != "" ? var.user_data : null

  # Enable monitoring
  monitoring = true

  # Enable IPv6
  ipv6 = true
}
