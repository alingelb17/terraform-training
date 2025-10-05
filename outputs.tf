# for module 6 outputs exercise

output "my_akamai_group" {
    description = "ID of group identified for module 4"
    value = data.akamai_group.my_group.id
}

output "my_appsec_config" {
    description = "ID of appsec config identified for module 4"
    value = data.akamai_appsec_configuration.my_appsec_config.id
}

output "my_property" {
    description = "ID of property identified for module 4"
    value = data.akamai_property.my_akamai_property.id
}
