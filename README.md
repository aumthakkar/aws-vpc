Hello, 

Thanks for your interest in my repo which creates an AWS VPC 

This repo consists of .tf files which can be used to create an entire functional AWS VPC. 
The variables.tf file can be used to change the values provided for all the variables used to create the AWS VPC

In order to make this vpc functional in your environment, you will first have to generate ssh keys named "awskey" using the "ssh-keygen -f awskey" command in the directory from where you will fire the terraform commmand -
 "terraform apply --auto-approve"

