ssh-key:
	mkdir ${home}/.ssh
	ssh-keygen -m PEM -f ${home}/.ssh/aws

install-dynamic-inventory-plugin:
	sudo apt-get install python3
	sudo pip3 install --user boto3	

installTerraform:
	sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
	curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
	sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
	sudo apt-get update && sudo apt-get install terraform

InstallAWScli:
	curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
	unzip awscliv2.zip
	sudo ./aws/install
	rm -rf ./aws

prepare: installTerraform
	aws configure

init:
	terraform init

apply:
	terraform plan
	terraform apply

ansible-playbook:
	ansible-playbook ./ansible/main.yaml 
