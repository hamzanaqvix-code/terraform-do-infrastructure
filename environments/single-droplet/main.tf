terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
  required_version = ">= 1.0"
}

provider "digitalocean" {
  token = var.do_token
}

# Provision a single Debian 12 droplet
module "web" {
  source = "../../modules/droplet"

  name                = "${var.project_name}-web"
  region              = var.region
  size                = var.droplet_size
  image               = "debian-12-x64"
  ssh_key_fingerprint = var.ssh_key_fingerprint
  tags                = [var.project_name, "web", "debian"]
}

# Attach firewall to the droplet
module "firewall" {
  source = "../../modules/firewall"

  name        = "${var.project_name}-firewall"
  droplet_ids = [module.web.id]
}
