#------------------------------------------
# Output of each resource
#------------------------------------------
output "vnet_id" {
  value =module.vnet.vnet_id
}
output "vnet_name" {
  value =module.vnet.vnet_name
}
output "firewall" {
  value =module.vnet.firewall
}
output "mgmt" {
  value =module.vnet.mgmt
}
output "app-gw" {
  value =module.vnet.app-gw
}
output "lb" {
  value =module.vnet.lb
}
output "gateway" {
  value =module.vnet.gateway
}