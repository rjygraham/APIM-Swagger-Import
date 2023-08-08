param location string = resourceGroup().location
param skuName string = 'Consumption'
param skuCapacity int = 0
param publisherEmail string
param publisherName string

// The uniqueString function is deterministic when seeded with static values.
var apimName = '${uniqueString(resourceGroup().id)}-apim'

resource apim 'Microsoft.ApiManagement/service@2023-03-01-preview' = {
  name: apimName
  location: location
  sku: {
    name: skuName
    capacity: skuCapacity
  }
  properties: {
    publisherEmail: publisherEmail
    publisherName: publisherName
  }
}

// Output the aname of the 
output apimServiceName string = apim.name
