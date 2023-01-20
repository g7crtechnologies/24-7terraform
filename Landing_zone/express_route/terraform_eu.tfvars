#Variable for East US Region
location ="eastus"
public_ip_sku         = "Standard"
pip_allocation_method = "Static"
authorization_name    = "hub-auth"
er_config = {
  bandwidth_in_mbps        = 50
  name                     = "hub"
  peering_location         = "Silicon Valley"
  service_provider_name    = "AT&T Netbond"
  allow_classic_operations = false
}
vng_config = {
  name          = "vpn_gateway"
  sku           = "HighPerformance"
  type          = "ExpressRoute"
  active_active = false
}
con_config = {
  authorization_key = "b79136fe-3699-4381-b866-b08411393e7b"
  name              = "connections-gw"
  type              = "ExpressRoute"
}
sku = {
  family = "MeteredData"
  tier   = "Standard"
}
