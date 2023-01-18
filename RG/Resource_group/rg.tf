module "rg" {
  source    = "../../RG/module"
  env       = var.env
  component = var.component
  region    = var.region
  location  = var.region
  tags      = var.tags
}
   