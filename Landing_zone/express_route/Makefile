.PHONY: init-er-eu, init-er-wu, plan-er-eu, plan-er-wu, apply-er-eu, apply-er-wu, plan-er, apply-er, help
module=DEFAULT
##
## init: run terraform init. usage: make init-{env} [ env = init-dev / init-prod ]
az-er-eu:
	@az account set --name=sub-speech-hub
az-er-wu:
	@az account set --name=sub-speech-hub


init-er-eu: az-er-eu
	@terraform init -backend-config=storage_account_name="tfsstrghubtfstate" -backend-config=container_name="tfstate" -backend-config=key="eastus/hub/express_route/terraform_eu/default.tfstate" -backend-config=resource_group_name="tfs-rg-hub-eu-tfstate" -upgrade -reconfigure -var-file=terraform_eu.tfvars
init-er-wu: az-er-wu
	@terraform init -backend-config=storage_account_name="tfsstrghubtfstate" -backend-config=container_name="tfstate" -backend-config=key="westus/hub/express_route/terraform_eu/default.tfstate" -backend-config=resource_group_name="tfs-rg-hub-eu-tfstate" -upgrade -reconfigure -var-file=terraform_eu.tfvars
## plan-er-eu: run terraform plan on the er-eu workspace. usage: make plan-er-eu module=<module name>
plan-er-eu: init-er-eu
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=terraform_eu.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## plan-er-wu: run terraform plan on the er-wu workspace. usage: make plan-er-wu module=<module name>
plan-er-wu: init-er-wu
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=terraform_wu.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif


## apply-er-eu: run terraform apply on the er-eu workspace. usage: make apply-er-eu module=<module name>
apply-er-eu: init-er-eu
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=terraform_eu.tfvars -parallelism=20
else
	@terraform apply -target=$(module)
endif

## apply-er-wu: run terraform apply on the er-wu workspace. usage: make apply-er-wu module=<module name>
apply-er-wu: init-er-wu
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=terraform_wu.tfvars -parallelism=20
	@cd .\env\ && make apply-mg
else
	@terraform apply -target=$(module)
endif

## plan in both region
plan-er: plan-er-eu plan-er-wu 
## apply in both region
apply-er: apply-er-wu apply-er-wu

help: Makefile
	@sed -n 's/^##//p' $<

.DEFAULT_GOAL := help