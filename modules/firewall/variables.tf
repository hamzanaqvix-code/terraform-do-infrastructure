variable "name" {
  description = "Firewall name"
  type        = string
}

variable "droplet_ids" {
  description = "List of droplet IDs to attach firewall to"
  type        = list(string)
}

variable "allowed_ssh_ips" {
  description = "List of IPs allowed to SSH. Use 0.0.0.0/0 to allow all (not recommended)"
  type        = list(string)
  default     = ["0.0.0.0/0", "::/0"]
}
