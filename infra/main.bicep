// It is convention to specify the location parameter and assign the
// `resourceGroup().location` function as the default value.
param location string = resourceGroup().location

// API Management service parameters
param apimSkuName string
param apimSkuCapacity int
param apimPublisherEmail string
param apimPublisherName string

// Module to deploy the API Managment service.
module apimService 'apim-service.bicep' = {
  name: 'apim'
  params: {
    location: location
    skuName: apimSkuName
    skuCapacity: apimSkuCapacity
    publisherEmail: apimPublisherEmail
    publisherName: apimPublisherName
  }
}

// Module to deploy APIs into the API Manamement service created in module above.
// Since this module refers to the outputs of the `apimServiceName` output, there is
// an implicit dependency created here and Azure will ensure the APIM service is 
// created before deploying the APIs module.
module apis 'apis.bicep' = {
  name: 'apis'
  params: {
    apimServiceName: apimService.outputs.apimServiceName
  }
}

// Other services can go above/below the API Managmenet modules. For instance,
// Azure Functions, Azure Container Apps, database services, etc, etc.
