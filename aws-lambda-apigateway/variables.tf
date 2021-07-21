
variable "enable_certificate" {
  description = "Set to true to enable certificate generation to serve behind custom HTTPS"
  default = false
}

variable "custom_domain_name" {
  default = "function.example.com"
}