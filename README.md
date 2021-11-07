# Simple Azure Terraform Deployment

## Prerequisites 
- Azure CLI
- Terraform 0.15+
- Login to Azure using Azure CLI

```bash
az login
```
This Terraform module creates following resources

- Resource Group
- Virtual Network
- 4 Subnets
- 4 NSGs
- 1 Bastion windows VM with pulic IP address
- 1 Web Linux VM with public IP address
