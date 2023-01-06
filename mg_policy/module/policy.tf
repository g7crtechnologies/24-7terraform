module "Azure_policies" {
  source           = "../policy"
  policy           = var.policy
  display_name = var.display_name
}
