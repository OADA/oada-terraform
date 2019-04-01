### Terraform script to run OADA in AWS environment
* Need to generate a secret key and an access token for the AWS account.
* If you are an AWS Go account user then you need to have a token as well.
* Install terraform in your local machine.
* Clone the repo.
* Then go inside of the repo.
* Execute "terraform init" command.
* Then execute "terraform plan" command.
* As the final step execute "terraform apply" command.
* Go to "ec2_instance_ip/.well-known/oada-configuration" to check whether OADA is running.