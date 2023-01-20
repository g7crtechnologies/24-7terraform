#Output of each resources 
output "vnet_id" {
    value = local.vnet_id.0
}
output "vnet_name" {
    value = local.vnet_name.0
}
output "firewall" {
    value = local.subnet_id.0
}
output "mgmt" {
    value = local.subnet_id.1
}
output "app-gw" {
    value = local.subnet_id.2
}
output "lb" {
    value = local.subnet_id.3
}
output "gateway" {
    value = local.subnet_id.4
}