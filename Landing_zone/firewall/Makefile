.PHONY: init-fw-eu, init-fw-wu, plan-fw-eu, plan-fw-wu, apply-fw-eu, apply-fw-wu, plan-fw, apply-fw, help
module=DEFAULT
##
## init: run terraform init. usage: make init-{env} [ env = init-dev / init-prod ]
az-fw-eu:
	@az account set --name=Gaurav-and-Pulluru-MSDN
az-fw-wu:
	@az account set --name=Gaurav-and-Pulluru-MSDN


init-fw-eu: az-fw-eu
	@terraform init -backend-config=storage_account_name="managementgroup123" -backend-config=container_name="managementgroup" -backend-config=key="eastus/firewall/hub/default.tfstate" -backend-config=resource_group_name="management_group" -upgrade -reconfigure -var-file=terraform_eu.tfvars
init-fw-wu: az-fw-wu
	@terraform init -backend-config=storage_account_name="managementgroup123" -backend-config=container_name="managementgroup" -backend-config=key="westus/firewall/hub/default.tfstate" -backend-config=resource_group_name="management_group" -upgrade -reconfigure -var-file=terraform_wu.tfvars
## plan-fw-eu: run terraform plan on the fw-eu workspace. usage: make plan-fw-eu module=<module name>
plan-fw-eu: init-fw-eu
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=terraform_eu.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## plan-fw-wu: run terraform plan on the fw-wu workspace. usage: make plan-fw-wu module=<module name>
plan-fw-wu: init-fw-wu
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=terraform_wu.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif


## apply-fw-eu: run terraform apply on the fw-eu workspace. usage: make apply-fw-eu module=<module name>
apply-fw-eu: init-fw-eu
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=terraform_eu.tfvars -parallelism=20
else
	@terraform apply -target=$(module)
endif

## apply-fw-wu: run terraform apply on the fw-wu workspace. usage: make apply-fw-wu module=<module name>
apply-fw-wu: init-fw-wu
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=terraform_wu.tfvars -parallelism=20
	@cd .\env\ && make apply-mg
else
	@terraform apply -target=$(module)
endif
## plan whole variables
plan-mg: plan-fw-eu plan-fw-wu 
## apply on both region
apply-mg: apply-fw-eu apply-fw-wu

help: Makefile
	@sed -n 's/^##//p' $<

.DEFAULT_GOAL := help