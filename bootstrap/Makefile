TERRAFORM_BIN = $(shell which terraform)

init:
	$(TERRAFORM_BIN) init -backend=false

upgrade:
	$(TERRAFORM_BIN) init -backend=false -upgrade

validate: init
	$(TERRAFORM_BIN) validate

plan: clean-plan-output terraform-local-config
	$(TERRAFORM_BIN) plan \
		-var="aws_region=$(AWS_REGION)" \
		-out plan.out

apply: terraform-local-config
	$(TERRAFORM_BIN) apply \
	-auto-approve -input=false plan.out
	rm -f plan.out

destroy: terraform-local-config
	$(TERRAFORM_BIN) destroy

clean-plan-output:
	-rm -f plan.out

clean:
	@rm -rf .terraform

.PHONY: docs
docs:
	terraform-docs --sort-by required markdown table . > docs/USAGE.md

terraform-local-config:
	$(TERRAFORM_BIN) init \
	  -backend=true \
	  -backend-config="path=state/terraform.tfstate"
