data "akamai_group" "andre_terraform_test" {
    group_name = "VidyaTest"
    contract_id = "1-3CV382"
}

output "example" {

    value = data.akamai_group.andre_terraform_test.id
}

data "akamai_appsec_configuration" "andre_terraform_test_sec" {

}


data "akamai_appsec_configuration" "app_sec_sample"{
    name = "AMTest"
}

output "sec_config_sample" {
    value = data.akamai_appsec_configuration.app_sec_sample.config_id
}

data "akamai_property" "andre_terraform_property" {
    name = "ssltest"
    version = "3"
}

output "propety_example" {
    value = data.akamai_property.andre_terraform_property.name
}