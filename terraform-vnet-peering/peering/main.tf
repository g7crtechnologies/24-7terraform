module "peering" {
  source                    = "../peering"
  rg_sub_source             = var.rg_sub_source
  vnet_name_sub_source      = var.peering_name_source
  rg_sub_destination        = var.rg_sub_destination
  vnet_name_sub_destination = var.vnet_name_sub_destination
  peering_name_source       = var.peering_name_source
  peering_name_destination  = var.peering_name_destination
}
