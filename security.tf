resource "akamai_appsec_configuration" "avincent_sec_config" {
 name        = "avincent-terraform-lab2"
 description = "Test config for Terraform training"
 contract_id = "1-3CV382"
 group_id    = "18385"
 host_names  = ["006-dn001-rkalyanscmaf.akamaiorigin.net"]
}

resource "akamai_appsec_security_policy" "avincent_sec_policy" {
  config_id              = 120821
  default_settings       = true
  security_policy_name   = "avincent-test-policy"
  security_policy_prefix = "1234"
}

resource "akamai_appsec_security_policy" "avincenti_sec_policy_duplicate" {
  config_id                      = 120821
  create_from_security_policy_id = "1234_316367"
  security_policy_name           = "dup"
  security_policy_prefix         = "1642"
}