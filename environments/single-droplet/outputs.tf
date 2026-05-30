output "droplet_ip" {
  description = "Public IP address of the droplet"
  value       = module.web.ipv4_address
}

output "droplet_name" {
  description = "Name of the droplet"
  value       = module.web.name
}

output "firewall_id" {
  description = "ID of the attached firewall"
  value       = module.firewall.id
}

output "ssh_command" {
  description = "SSH command to connect to the droplet"
  value       = "ssh root@${module.web.ipv4_address}"
}
