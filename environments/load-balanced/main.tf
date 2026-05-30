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

# Provision two web droplets
module "web_1" {
  source = "../../modules/droplet"

  name                = "${var.project_name}-web-01"
  region              = var.region
  size                = var.droplet_size
  image               = "debian-12-x64"
  ssh_key_fingerprint = var.ssh_key_fingerprint
  tags                = [var.project_name, "web", "debian"]
}

module "web_2" {
  source = "../../modules/droplet"

  name                = "${var.project_name}-web-02"
  region              = var.region
  size                = var.droplet_size
  image               = "debian-12-x64"
  ssh_key_fingerprint = var.ssh_key_fingerprint
  tags                = [var.project_name, "web", "debian"]
}

# Attach firewall to both droplets
module "firewall" {
  source = "../../modules/firewall"

  name        = "${var.project_name}-firewall"
  droplet_ids = [module.web_1.id, module.web_2.id]
}

# DigitalOcean Load Balancer distributing traffic across both droplets
resource "digitalocean_loadbalancer" "this" {
  name   = "${var.project_name}-lb"
  region = var.region

  forwarding_rule {
    entry_protocol  = "http"
    entry_port      = 80
    target_protocol = "http"
    target_port     = 80
  }

  healthcheck {
    protocol               = "http"
    port                   = 80
    path                   = "/"
    check_interval_seconds = 10
    response_timeout_seconds = 5
    unhealthy_threshold    = 3
    healthy_threshold      = 2
  }

  droplet_ids = [module.web_1.id, module.web_2.id]
}
