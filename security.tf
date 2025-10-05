# terraform item 5 (resources) exercise #1

# need group/contract to create security config
# from: https://techdocs.akamai.com/terraform/docs/common-identifiers

# data "akamai_group" "my_group" computed in main.tf

data "akamai_contract" "my_contract" {
#    id = "ctr_1-5C13OE"
    group_name = data.akamai_group.my_group.group_name
}

output "my_contract" {
    value = data.akamai_contract.my_contract
}

output "my_group" {
    value = data.akamai_group.my_group
}

/*
data "akamai_appsec_configuration" "my-configurations" {
}

output "configuration-list" {
  value = data.akamai_appsec_configuration.my-configurations.output_text
}
*/

# my_appsec_config defined in main.tf
#data "akamai_appsec_configuration" "my_appsec_config" {
#    id = 3684
#}

/*
output "my_appsec_config" {
  value = data.akamai_appsec_configuration.my_appsec_config
}
*/

resource "akamai_appsec_configuration" "my_appsec_cfg" {
  description = "new security config via terraform"
  name = "alingelb-terraform-lab"
  host_names = ["redoubt.com", "www.redoubt.com"]
  # from https://github.com/akamai/terraform-examples/blob/main/products/aap/modules/config/config.tf
  group_id = trimprefix(data.akamai_group.my_group.id, "grp_") 
  contract_id = trimprefix(data.akamai_contract.my_contract.id, "ctr_")
}

resource "akamai_appsec_security_policy" "akamai_appsec_security_policy_1" {
  config_id = akamai_appsec_configuration.my_appsec_cfg.id
  security_policy_name = "new security policy via terraform #1"
  security_policy_prefix = "TFM1"
}

resource "akamai_appsec_security_policy" "akamai_appsec_security_policy_2" {
  config_id = akamai_appsec_configuration.my_appsec_cfg.id
  security_policy_name = "new security policy via terraform #2"
  security_policy_prefix = "TFM2"
}


