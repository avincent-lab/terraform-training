output "group_id" {
    value = data.akamai_group.andre_terraform_test.id
}

output "sec_config_id" {
    value = data.akamai_appsec_configuration.app_sec_sample.config_id
}

output "propety_id" {
    value = data.akamai_property.andre_terraform_property.property_id
}