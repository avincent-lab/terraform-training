resource "akamai_edge_hostname" "avincent_edge_hostname" {
  product_id    = "prd_Alta"
  contract_id   = "1-3CV382"
  group_id      = "18385"
  edge_hostname = "avincent.com.edgesuite.net"
  ip_behavior   = "IPV4"
}

data "akamai_property_rules_builder" "avincent_default_rule" {
  rules_v2023_01_05 {
    name      = "default"
    is_secure = false
    }
}
output "default_rule" {
  value = data.akamai_property_rules_builder.avincent_default_rule
      }

resource "local_file" "rules" {
    content  = data.akamai_property_rules_builder.avincent_default_rule.json
    filename = "./main.json"
}

resource "akamai_property" "avincent_test_property" {
  name          = "avincent_test_property"
  product_id    = "prd_Alta"
  contract_id   = "1-3CV382"
  group_id      = "18385"
  rule_format   = "v2025-07-07"
  rules         = file("${path.root}/main.json")
  hostnames {
    cname_from             = "avincent.com"
    cname_to               = "avincent.com.edgekey.net"
    cert_provisioning_type = "DEFAULT"
  }
}