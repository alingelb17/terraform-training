# update .edgerc with section "terraform", specifying account_key

# http --auth-type=edgegrid -a default: ":/papi/v1/groups?accountSwitchKey=1-5C13LW:1-8BYUX"
#   [snip]
#            {
#                "contractIds": [
#                    "ctr_1-5C13OE"
#                ],
#                "groupId": "grp_18545",
#                "groupName": "TC Public-1-5C13OE"
#            }
#   [snip]
data "akamai_groups" "my-groups" {
}

# output "groups" {
#   value = data.akamai_groups.my-groups
# }

data "akamai_group" "my_group" {
  group_name = "TC Public-1-5C13OE"
  contract_id = "ctr_1-5C13OE"
}

output "group" {
  value = data.akamai_group.my_group
}

# reference a single config
# http --auth-type=edgegrid -a default: ":/appsec/v1/configs?accountSwitchKey=1-5UAZM"
data "akamai_appsec_configuration" "my_appsec_config" {
  name = "WAF Security File"
}

output "appsec_config" {
  value = data.akamai_appsec_configuration.my_appsec_config
}

# https  --auth-type=edgegrid -a default: ":/papi/v1/properties?accountSwitchKey=1-5C13LW:1-8BYUX&contractId=ctr_C-NO4K5H&groupId=grp_41734"
data "akamai_properties" "my_properties" {
    group_id    = "grp_18545"
    contract_id = "ctr_1-5C13OE"
}

#output "properties" {
#  value = data.akamai_properties.my_properties
#}

# reference a single property
data "akamai_property" "my_akamai_property" {
    name = "alingelb-redoubt.com"
}

output "property" {
  value = data.akamai_property.my_akamai_property
}
