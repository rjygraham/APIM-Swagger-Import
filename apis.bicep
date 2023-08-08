param apimServiceName string

var apisName = 'Conference'
var apisPath = 'conference'

// Existing API Management resource created in the `apim-service.bicep` module.
resource apim 'Microsoft.ApiManagement/service@2023-03-01-preview' existing = {
  name: apimServiceName
}

// APIs child resource which imports the Swagger definition.
resource apis 'Microsoft.ApiManagement/service/apis@2023-03-01-preview' = {
  name: apisName
  parent: apim
  properties: {
    path: apisPath
    format: 'swagger-json'
    value: loadTextContent('swagger.json')
  }
}
