# Terraform DigitalOcean Infrastructure

Terraform configurations for provisioning DigitalOcean infrastructure using reusable modules. Covers single-droplet deployments and load-balanced multi-droplet setups.

## Structure

    terraform-do-infrastructure/
    ├── modules/
    │   ├── droplet/        # Reusable Droplet module
    │   └── firewall/       # Reusable Firewall module
    ├── environments/
    │   ├── single-droplet/ # One Droplet + Firewall
    │   └── load-balanced/  # Two Droplets + Firewall + Load Balancer
    └── variables.tf

## Modules

### droplet
Provisions a DigitalOcean Droplet with configurable name, region, size, image, SSH key, and tags. Monitoring and IPv6 enabled by default.

### firewall
Provisions a DigitalOcean Cloud Firewall and attaches it to one or more Droplets. Default rules allow SSH, HTTP (80), HTTPS (443), and ICMP inbound. All outbound traffic is permitted.

## Environments

### single-droplet
Provisions one Debian 12 Droplet with an attached firewall. Outputs the public IP, droplet name, firewall ID, and a ready-to-use SSH command.

### load-balanced
Provisions two Debian 12 Droplets with a shared firewall and a DigitalOcean Load Balancer distributing HTTP traffic across both. Includes health checks with configurable thresholds.

## Usage

    # Clone the repo
    git clone https://github.com/hamzanaqvix-code/terraform-do-infrastructure.git
    cd terraform-do-infrastructure

    # Choose an environment
    cd environments/single-droplet

    # Copy the example vars file and fill in your values
    cp example.tfvars terraform.tfvars
    nano terraform.tfvars

    # Initialise, plan, and apply
    terraform init
    terraform plan
    terraform apply

    # Destroy when done
    terraform destroy

## Variables

| Variable | Description | Default |
|----------|-------------|---------|
| do_token | DigitalOcean API token | required |
| region | DO region slug | nyc1 |
| project_name | Name prefix for all resources | hamza-infra |
| droplet_size | Droplet size slug | s-1vcpu-1gb |
| ssh_key_fingerprint | SSH key fingerprint from DO account | required |

## Getting your SSH key fingerprint

    curl -s -X GET \
      -H "Authorization: Bearer YOUR_DO_TOKEN" \
      "https://api.digitalocean.com/v2/account/keys"

## Security

- API token is always passed via terraform.tfvars which is gitignored
- Never hardcode credentials in .tf files
- terraform.tfvars and all .tfstate files are excluded from git via .gitignore

## Verified on

- Terraform v1.15.5 on darwin/arm64 (Apple M2)
- DigitalOcean provider v2.x
- Droplet provisioned and destroyed successfully in nyc1 region
