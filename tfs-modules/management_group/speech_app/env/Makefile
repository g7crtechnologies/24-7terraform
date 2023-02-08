.PHONY: init-dev, init-prod, init-prod, init-qa, init-stg, init-stb, plan-dev, plan-prod, plan-qa, plan-stg, plan-stb, apply-dev, apply-prod, apply-qa, apply-stg, apply-stb, plan-mg, help
module=DEFAULT
approve=-auto-approve
##
## init: run terraform init. usage: make init-{env} [ env = init-dev / init-prod ]
az-dev:
	@az account set -s fd2d6291-f998-4e73-95d6-12dc7a0a20c8
az-prod:
	@az account set -s fd2d6291-f998-4e73-95d6-12dc7a0a20c8
az-hub:
	@az account set -s fd2d6291-f998-4e73-95d6-12dc7a0a20c8
az-iac:
	@az account set -s fd2d6291-f998-4e73-95d6-12dc7a0a20c8
az-qa:
	@az account set -s fd2d6291-f998-4e73-95d6-12dc7a0a20c8
az-stg:
	@az account set -s fd2d6291-f998-4e73-95d6-12dc7a0a20c8
az-stb:
	@az account set -s fd2d6291-f998-4e73-95d6-12dc7a0a20c8
az-products:
	@az account set -s fd2d6291-f998-4e73-95d6-12dc7a0a20c8
az-speech-application:
	@az account set -s fd2d6291-f998-4e73-95d6-12dc7a0a20c8

init-dev: az-dev
	@terraform init -backend-config=storage_account_name="tfsstghubtfstate" -backend-config=container_name="tfstate" -backend-config=key="mg/products/speech-application/dev/default.tfstate" -backend-config=resource_group_name="tfs-rg-hub-tfstate" -upgrade -reconfigure -var-file=dev.tfvars
init-prod: az-prod
	@terraform init -backend-config=storage_account_name="tfsstghubtfstate" -backend-config=container_name="tfstate" -backend-config=key="mg/products/speech-application/prod/default.tfstate" -backend-config=resource_group_name="tfs-rg-hub-tfstate" -upgrade -reconfigure -var-file=prod.tfvars
init-qa: az-qa
	@terraform init -backend-config=storage_account_name="tfsstghubtfstate" -backend-config=container_name="tfstate" -backend-config=key="mg/products/speech-application/qa/default.tfstate" -backend-config=resource_group_name="tfs-rg-hub-tfstate" -upgrade -reconfigure -var-file=qa.tfvars
init-stg: az-stg
	@terraform init -backend-config=storage_account_name="tfsstghubtfstate" -backend-config=container_name="tfstate" -backend-config=key="mg/products/speech-application/stg/default.tfstate" -backend-config=resource_group_name="tfs-rg-hub-tfstate" -upgrade -reconfigure -var-file=staging.tfvars
init-stb: az-stb
	@terraform init -backend-config=storage_account_name="tfsstghubtfstate" -backend-config=container_name="tfstate" -backend-config=key="mg/products/speech-application/stb/default.tfstate" -backend-config=resource_group_name="tfs-rg-hub-tfstate" -upgrade -reconfigure -var-file=stb.tfvars

## plan-dev: run terraform plan on the staging workspace. usage: make plan-dev module=<module name>
plan-dev: init-dev
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=dev.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## plan-prod: run terraform plan on the prod workspace. usage: make plan-prod module=<module name>
plan-prod: init-prod
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=prod.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## plan-qa: run terraform plan on the qa workspace. usage: make plan-qa module=<module name>
plan-qa: init-qa
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=qa.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## plan-stg: run terraform plan on the stg workspace. usage: make plan-stg module=<module name>
plan-stg: init-stg
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=staging.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## plan-stb: run terraform plan on the stb workspace. usage: make plan-stb module=<module name>
plan-stb: init-stb
ifeq (DEFAULT,$(module))
	@terraform plan -var-file=stb.tfvars -parallelism=20
else
	@terraform plan -target=$(module)
endif

## apply-dev: run terraform apply on the dev workspace. usage: make apply-dev module=<module name>
apply-dev: init-dev
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=dev.tfvars $(approve) -parallelism=20
else
	@terraform apply -target=$(module)
endif

## apply-prod: run terraform apply on the prod workspace. usage: make apply-prod module=<module name>
apply-prod: init-prod
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=prod.tfvars $(approve) -parallelism=20
else
	@terraform apply -target=$(module)
endif

## apply-qa: run terraform apply on the qa workspace. usage: make apply-qa module=<module name>
apply-qa: init-qa
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=qa.tfvars $(approve) -parallelism=20
else
	@terraform apply -target=$(module)
endif

## apply-stg: run terraform apply on the stg workspace. usage: make apply-stg module=<module name>
apply-stg: init-stg
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=staging.tfvars $(approve) -parallelism=20
else
	@terraform apply -target=$(module)
endif

## apply-stb: run terraform apply on the stb workspace. usage: make apply-stb module=<module name>
apply-stb: init-stb
ifeq (DEFAULT,$(module))
	@terraform apply -var-file=stb.tfvars $(approve) -parallelism=20
else
	@terraform apply -target=$(module)
endif

## plan whole variables
plan-mg: plan-qa plan-stg plan-stb plan-dev plan-prod
##
apply-mg:  apply-qa apply-stg apply-stb apply-dev apply-prod
help: Makefile
	@sed -n 's/^##//p' $<

.DEFAULT_GOAL := help