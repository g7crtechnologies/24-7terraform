output "vnet_id" {
  value = tomap({
    for k, s in module.vnet : k => s.id
  })

}


