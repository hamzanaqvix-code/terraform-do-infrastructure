output "load_balancer_ip" {
  description = "Public IP of the load balancer"
  value       = digitalocean_loadbalancer.this.ip
}

output "web_01_ip" {
  description = "Public IP of web-01"
  value       = module.web_1.ipv4_address
}

output "web_02_ip" {
  description = "Public IP of web-02"
  value       = module.web_2.ipv4_address
}

output "ssh_web_01" {
  description = "SSH command for web-01"
  value       = "ssh root@${module.web_1.ipv4_address}"
}

output "ssh_web_02" {
  description = "SSH command for web-02"
  value       = "ssh root@${module.web_2.ipv4_address}"
}
