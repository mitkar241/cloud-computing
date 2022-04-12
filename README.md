# tagrant
---
A terraform repository

### vscode extensions
---
```bash
code --list-extensions
```
```
4ops.terraform
amazonwebservices.aws-toolkit-vscode
```
```bash
code --install-extension amazonwebservices.aws-toolkit-vscode
```

### terraform installation
---
```bash
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt update && sudo apt install terraform -y
```

### commands used
---
```bash
terraform init
```
```bash
ls -a
```
```
.  .. dev.setup.public.tf  .terraform  .terraform.lock.hcl
```

```bash
terraform fmt
```
```bash
terraform plan
terraform apply -auto-approve
```
```bash
terraform state list
terraform show
```
```bash
terraform plan -destroy
terraform apply -destroy -auto-approve
```
