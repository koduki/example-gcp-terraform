# README

## Overview

This project is an example for enterpise levels GCP mangement with Terafrom IaC pipeline.
You can also see more detail from below.

https://zenn.dev/koduki/articles/78a36c07020638

ref:
- [Best practices for enterprise organizations](https://cloud.google.com/docs/enterprise/best-practices-for-enterprise-organizations)
- [Shared VPC](https://cloud.google.com/vpc/docs/shared-vpc)
- [Managing infrastructure as code with Terraform, Cloud Build, and GitOps ](https://cloud.google.com/architecture/managing-infrastructure-as-code)
- [Terraform - Google Cloud Platform Provider](https://registry.terraform.io/providers/hashicorp/google/latest/docs)


## CLI

There are some utility CLI

Exec terraform command.

```bash
cli/terraform.sh -d projects/02_cmn/sharedvpc-cmn/environments/dev init
cli/terraform.sh -d projects/02_cmn/sharedvpc-cmn/environments/dev plan
```

Rebuild environment branches from main-branch

```bash
cli/rebuild-pr-branch.sh all
cli/rebuild-pr-branch.sh prd
```
