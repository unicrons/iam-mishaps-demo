TERRAFORM_BIN = $(shell which terraform)
TFVARS_FILE = ./config/terraform.tfvars
TERRAFORM_BUCKET = sh3llcon-tfstates
TFSTATE_FILE = infra/case1.tfstate

init:
	$(TERRAFORM_BIN) init -backend=false

upgrade:
	$(TERRAFORM_BIN) init -backend=false -upgrade

validate: init
	$(TERRAFORM_BIN) validate

format:
	$(TERRAFORM_BIN) fmt .

plan: clean-plan-output terraform-remote-config
	$(TERRAFORM_BIN) plan \
		-var-file=$(TFVARS_FILE) \
		-var="aws_region=$(AWS_REGION)" \
		-out plan.out

apply: terraform-remote-config
	$(TERRAFORM_BIN) apply \
	-auto-approve -input=false plan.out
	rm -f plan.out

destroy: terraform-remote-config
	$(TERRAFORM_BIN) destroy \
		-var-file=$(TFVARS_FILE) \
		-var="aws_region=$(AWS_REGION)"

clean-plan-output:
	-rm -f plan.out

clean:
	@rm -rf .terraform

.PHONY: docs
docs:
	terraform-docs --sort-by required markdown table . > docs/USAGE.md

terraform-remote-config:
	$(TERRAFORM_BIN) init -reconfigure \
	  -backend=true \
	  -backend-config="bucket=$(TERRAFORM_BUCKET)" \
	  -backend-config="key=$(TFSTATE_FILE)" \
	  -backend-config="region=$(AWS_REGION)" \
	  -backend-config="encrypt=1"

ifndef AWS_REGION
	$(error "AWS_REGION not set")
endif
