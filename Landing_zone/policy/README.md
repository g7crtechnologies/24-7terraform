<!-- BEGIN_TF_DOCS -->
## **Azure policy**
This module will apply all the policies on the management groups
###### For iac mg 
       -	“make plan-iac”  to plan the terraform 
       -	“make apply-iac” to apply the terraform 
###### For root mg
       -	“make plan-root”  to plan the terraform 
       -	“make apply-root” to apply the terraform 
###### For hub mg
       -	“make plan-hub”  to plan the terraform 
       -	“make apply-hub” to apply the terraform 
###### For speech-application mg
       -	“make plan-speech-application”  to plan the terraform 
       -	“make apply-speech-application” to apply the terraform 
###### To apply all at once 
       -	“make plan-policy”  to plan the terraform to all mg
       -	“make apply-policy” to apply the terraform to all mg

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | =3.29.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_Azure_policies"></a> [Azure\_policies](#module\_Azure\_policies) | ../module/tfs_azurerm_policy | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | name of management group | `string` | n/a | yes |
| <a name="input_policy"></a> [policy](#input\_policy) | name of policy | <pre>map(object({<br>    name                 = string<br>    policy_definition_id = string<br>    description          = string<br>    display_name         = string<br>  }))</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
