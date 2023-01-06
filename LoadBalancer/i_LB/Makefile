.PHONY: init-lb-eu, init-lb-wu, plan-lb-eu, plan-lb-wu, apply-lb-eu, apply-lb-wu, plan-lb, apply-lb, help
module=DEFAULT
##
## init: run terraform init. usage: make init-{env} [ env = init-dev / init-prod ]
az-lb-eu:
	@az account set --name=Gaurav-and-Pulluru-MSDN
az-lb-wu:
	@az account set --name=Gaurav-and-Pulluru-MSDN


init-lb-eu: az-lb-eu
	@terraform init -backend-config=storage_account_name="managementgroup123" -backend-config=container_name="managementgroup" -backend-config=key="eastus/hub/terraform_eu/default.tfstate" -backend-config=resource_group_name="management_group" -upgrade -reconfigure -var-file=terraform_eu.tfvars
init-lb-wu: az-lb-wu
	@terraform init -backend-config=storage_account_name="managementgroup123" -backend-config=container_name="managementgroup" -backend-config=key="westus/hub/terraform_eu/default.tfstate" -backend-config=resource_group_name="management_group" -upgrade -reconfigure -var-file=terraform_eu.tfvars
## plan-lb-eu: run terraform plan on the lb-eu workspace. usage: make plan-lb-eu module=<module name>
plan-lb-eu: init-lb-eu
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=terraform_eu.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## plan-lb-wu: run terraform plan on the lb-wu workspace. usage: make plan-lb-wu module=<module name>
plan-lb-wu: init-lb-wu
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=terraform_wu.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif


## apply-lb-eu: run terraform apply on the lb-eu workspace. usage: make apply-lb-eu module=<module name>
apply-lb-eu: init-lb-eu
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=terraform_eu.tfvars -parallelism=20
else
	@terraform apply -target=$(module)
endif

## apply-lb-wu: run terraform apply on the lb-wu workspace. usage: make apply-lb-wu module=<module name>
apply-lb-wu: init-lb-wu
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=terraform_wu.tfvars -parallelism=20
	@cd .\env\ && make apply-mg
else
	@terraform apply -target=$(module)
endif

## plan in both region
plan-lb: plan-lb-eu plan-lb-wu 
## apply in both region
apply-lb: apply-lb-wu apply-lb-wu

help: Makefile
	@sed -n 's/^##//p' $<

.DEFAULT_GOAL := help