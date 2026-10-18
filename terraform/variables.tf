variable "project_name" {
  description = "Name prefix for e-commerce resources"
  type        = string
  default     = "ecommerce-skilltest3"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "dockerhub_username" {
  description = "Docker Hub username containing the application images"
  type        = string
  default     = "snehatandle"
}

variable "allowed_ssh_cidr" {
  description = "Your public IPv4 address in CIDR notation, for SSH access"
  type        = string
}
