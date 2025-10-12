# variables.tf
#   per variables module exercise
#   can use via e.g 
#     terraform plan -var "config_section=terraform-govtsvcsintlab"

variable "edgerc_path" {
  type = string
  default = "/Users/alingelb/.edgerc"
  description = "path the the edgerc file"
}

variable "config_section" {
  type = string
  default = "terraform-tcpublic"
  description = "the configuration section within the edgerc file to use for API access"
}
