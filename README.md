# tagrant
---
A terraform repository

### Codebase Structure
---
```
.
├── ansible
│   └── README.md
├── apps
│   └── devsetup
│       ├── datasources.tf
│       ├── main.tf
│       ├── Makefile
│       ├── outputs.tf
│       ├── providers.tf
│       ├── ssh.config.tpl
│       └── variables.tf
├── envs
│   ├── dvlp
│   │   └── devsetup.tfvars
│   ├── prod
│   │   └── devsetup.tfvars
│   ├── stag
│   │   └── devsetup.tfvars
│   └── test
│       └── devsetup.tfvars
├── modules
│   ├── apps
│   │   ├── api-server
│   │   │   └── README.md
│   │   └── website
│   │       └── README.md
│   ├── common
│   │   ├── acm
│   │   │   └── README.md
│   │   └── user
│   │       └── README.md
│   ├── compute
│   │   └── ec2
│   │       └── ubuntu
│   │           ├── main.tf
│   │           ├── outputs.tf
│   │           └── variables.tf
│   ├── data
│   │   ├── efs
│   │   │   └── README.md
│   │   ├── rds
│   │   │   └── README.md
│   │   └── s3
│   │       └── README.md
│   └── networking
│       ├── alb
│       │   └── README.md
│       ├── front-proxy
│       │   └── README.md
│       ├── vpc
│       │   └── README.md
│       └── vpc-pairing
│           └── README.md
├── packer
│   └── README.md
├── scripts
│   ├── basic.sh
│   ├── crypter.js
│   ├── github.sh
│   ├── nginx.sh
│   ├── nodejs.sh
│   ├── ssh.config.tpl
│   └── tagrant.conf
└── tools
    └── README.md
```

### VS Code Setup
---

[vscode-extn-md](vscode.md)

### AWS IAM Setup
---

[aws-iam-md](iam.md)

### Terraform Setup
---

[terraform-setup-md](terraform.md)

### Remote SSH using VS Code
---

[remote-ssh-md](remotessh.md)

### Commands Used
---

[cmds-used-md](commands.md)

### Resources
---
- [Learn Terraform (and AWS) by Building a Dev Environment](https://www.youtube.com/watch?v=iRaai1IBlB0)

### TODO
---
- Investigate if AWS regions have their own CIDRs configured and restricted.
- Add loadbalancer example and try for both (with HTTPS and HTTP, HTTP should redirect to HTTPS)
- Structure Repo to handle more setups
- Also look into reusability of code - module + backend
- Go through any `AWS Certified Cloud Practitioner Training` course.
- Check ECS free tier and plan for a terraform file, bonus: EKS.
- Windows compute is to be documented and automated

## VPC Course Contents
---
[AWS VPC Beginner to Pro - Virtual Private Cloud Tutorial](https://www.youtube.com/watch?v=g2JOHLHh4rI)
- Introduction
- IPv4 Addressing Primer
- Amazon VPC Overview
- Defining VPC CIDR Blocks
- VPC Wizard
- Create a Custom VPC with Subnets
- Launch Instances and Test VPC
- Security Groups and Network ACL
- Configure Security Groups and NACLs
- Amazon VPC Peering
- Configure VPC Peering
- VPC Endpoints
- Create VPC Endpoint
- AWS Client VPN
- AWS Site-to-Site VPN
- AWS VPN CloudHub
- AWS Direct Connect (DX)
- AWS Direct Connect Gateway
- AWS Transit Gateway
- Using IPv6 in a VPC
- Create VPC Flow Logs
