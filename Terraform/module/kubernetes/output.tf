output "mckingapiproducao_deployment_name" {
  value = kubernetes_deployment.mckingapiproducao_deployment.metadata[0].name
}

output "mckingworkerproducao_deployment_name" {
  value = kubernetes_deployment.mckingworkerproducao_deployment.metadata[0].name
}

output "mckingapi_deployment_name" {
  value = kubernetes_deployment.mckingapi_deployment.metadata[0].name
}

