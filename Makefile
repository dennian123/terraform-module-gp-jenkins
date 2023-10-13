#to automate the process(mostly for testing purposes)
#not make any mistakes on .tfstate file - overwritten(forget to workspace select, new...)
#simply seperating/having .tfstate file on each region(virginia,ohio...) in different virtual folders

n.virginia:  #name of the blok
	terraform init
	terraform workspace new n.virginia || terraform workspace select n.virginia
	terraform apply -var-file usa-regions/n.virginia.tfvars --auto-approve
ohio:
	terraform init
	terraform workspace new ohio || terraform workspace select ohio
	terraform apply -var-file usa-regions/ohio.tfvars --auto-approve
n.california:
	terraform init
	terraform workspace new n.california || terraform workspace select n.california
	terraform apply -var-file usa-regions/n.california.tfvars --auto-approve
oregon: 
	terraform init 
	terraform workspace new oregon || terraform workspace select oregon
	terraform apply -var-file usa-regions/oregon.tfvars --auto-approve
#apply all(anyName EX: us-apply:) resources at once (spacifiy all names in single line)  	
usa-all-apply: n.virginia ohio n.california oregon


n.virginia-destroy:
	terraform init 
	terraform workspace select n.virginia
	terraform destroy -var-file usa-regions/n.virginia.tfvars --auto-approve	 
ohio-destroy:
	terraform init
	terraform workspace select ohio
	terraform destroy -var-file usa-regions/ohio.tfvars --auto-approve
n.california-destroy:
	terraform init
	terraform workspace select n.california
	terraform destroy -var-file usa-regions/n.california --auto-approve
oregon-destroy:
	terraform init
	terraform workspace select oregon
	terraform destroy -var-file usa-regions/oregon.tfvars --auto-approve		
usa-all-destroy: n.virginia ohio n.california oregon		


