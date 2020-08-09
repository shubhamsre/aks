variable "rg_name" {
  default = "aks-rg"
  description = "A prefix used for all resources"
}

variable "location" {
  default = "westus2"
  description = "The Azure Region in which all resources should be provisioned"
}

variable "node_count" {
  default = 1
}

variable "node_size" {
  default = "Standard_B2s"
}

variable "plugin" {
  default = "azure"
}

variable "lb_sku" {
  default = "basic"
}

variable "api_server_authorized_ip_ranges" {
  default = ["0.0.0.0/0", "122.162.216.83/32", "122.162.0.0/16"]
}

variable "tag_env" {
  default = "minimal_aks"
}

variable "admin_user" {
  default = "azuser"
}

