# API Managment IaC Swagger Import

This repo demonstrates how to import a Swagger definition into Azure API Management using Bicep.

### Deploy

To deploy this sample, provide a valid value for the `apimPublisherEmail` and `apimPublisherName` parameters in the the `main.dev.bicepparam` file.

Then deploy the template using Azure CLI:

```bash
az deployment group create -g Demo --template-file main.bicep --parameters main.dev.bicepparam
```