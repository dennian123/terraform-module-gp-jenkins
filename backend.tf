#our terraform.tfstate file will NOT be overwritten - versioning. It will be stored in backend S3
#to go back to previous changes - download state file 
terraform {
    backend "s3"{
        bucket = "erraform-project-ohio-backend"
        key    = "terraform-project/terraform.tfstate" #weare creating terraform.tfstate file inside kaizen(will be created) folder inside S3 bucket
        region = "us-east-2"
        #to place a LockID on resource(Create DynamoDB table(NoSQL)).Add here name of created dynamoDB
        #who first runn terraform apply - locked this file and only he can work with it
        dynamodb_table = "lock-state" 
    }
}

