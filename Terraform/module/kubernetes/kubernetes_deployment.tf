resource "kubernetes_deployment" "mckingapiproducao_deployment" {
  metadata {
    name = "mckingapiproducao"
  }

  spec {
    replicas = var.replicas

    selector {
      match_labels = {
        app = "mckingapiproducao-pod"
      }
    }

    template {
      metadata {
        labels = {
          app = "mckingapiproducao-pod"
        }
      }

      spec {
        container {
          name              = "mckingapiproducao-container"
          image             = "ghcr.io/renaneustaquio/mckingapiproducao:latest"
          image_pull_policy = "Always"

          port {
            container_port = var.container_port
          }

          env {
            name  = "ASPNETCORE_ENVIRONMENT"
            value = "Production"
          }
		  env {
		    name  = "FilaPedidos__Url"
		    value = var.fila_pedidos_url
		  }
          env {
            name  = "AWS__AccessKeyId"
            value = var.aws_access_key_id
          }

          env {
            name  = "AWS__SecretAccessKey"
            value = var.aws_secret_access_key
          }

          env {
            name  = "AWS__SessionToken"
            value = var.aws_session_token
          }
		  
		  env {
			name  = "AWS__Region"
			value = "us-east-1"
		  }

          resources {
            limits = {
              memory = var.memory_limit
              cpu    = var.cpu_limit
            }
            requests = {
              memory = var.memory_request
              cpu    = var.cpu_request
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_deployment" "mckingworkerproducao_deployment" {
  metadata {
    name = "mckingworkerproducao"
  }

  spec {
    replicas = var.replicas

    selector {
      match_labels = {
        app = "mckingworkerproducao-pod"
      }
    }

    template {
      metadata {
        labels = {
          app = "mckingworkerproducao-pod"
        }
      }

      spec {
        container {
          name              = "mckingworkerproducao-container"
          image             = "ghcr.io/renaneustaquio/mckingworkerproducao:latest"
          image_pull_policy = "Always"

          port {
            container_port = var.container_port
          }

          env {
            name  = "ASPNETCORE_ENVIRONMENT"
            value = "Production"
          }

          env {
            name  = "AWS__AccessKeyId"
            value = var.aws_access_key_id
          }

          env {
            name  = "AWS__SecretAccessKey"
            value = var.aws_secret_access_key
          }
		  
		  env {
			name  = "AWS__Region"
			value = "us-east-1"
		  }		  
		  
		  env {
		    name  = "FilaPedidos__Url"
		    value = var.fila_pedidos_url
		  }
		  
          env {
            name  = "AWS__SessionToken"
            value = var.aws_session_token
          }

          resources {
            limits = {
              memory = var.memory_limit
              cpu    = var.cpu_limit
            }
            requests = {
              memory = var.memory_request
              cpu    = var.cpu_request
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_deployment" "mckingapi_deployment" {
  metadata {
    name = "mckingapi"
  }

  spec {
    replicas = var.replicas

    selector {
      match_labels = {
        app = "mckingapi-pod"
      }
    }

    template {
      metadata {
        labels = {
          app = "mckingapi-pod"
        }
      }

      spec {
        container {
          name              = "mckingapi-container"
          image             = "ghcr.io/renaneustaquio/mckingapi:latest"
          image_pull_policy = "Always"

          port {
            container_port = var.container_port
          }

          env {
            name  = "ASPNETCORE_ENVIRONMENT"
            value = "Production"
          }

          env {
            name = "ConnectionStrings__DefaultConnection"
            value_from {
              secret_key_ref {
                name = var.secret_name
                key  = "postgres-connection-string"
              }
            }
          }

          env {
            name  = "MercadoPago__UrlBase"
            value = var.mercado_pago_url_base
          }

          env {
            name = "MercadoPago__ClientSecret"
            value_from {
              secret_key_ref {
                name = var.secret_name
                key  = "mercado-pago-client-secret"
              }
            }
          }
		  
		  env {
		    name  = "AWS__CognitoUserPoolId"
		    value = var.aws_cognito_user_pool_id
		  }		  
		  
          env {
            name  = "AWS__AccessKeyId"
            value = var.aws_access_key_id
          }

          env {
            name  = "AWS__SecretAccessKey"
            value = var.aws_secret_access_key
          }
		  
          env {
            name  = "AWS__SessionToken"
            value = var.aws_session_token
          }		  
		  
		  env {
			name  = "AWS__Region"
			value = "us-east-1"
		  }		  
		  
		  env {
		    name  = "FilaPedidos__Url"
		    value = var.fila_pedidos_url
		  }		  

          env {
            name = "MercadoPago__ClientId"
            value_from {
              secret_key_ref {
                name = var.secret_name
                key  = "mercado-pago-client-id"
              }
            }
          }

          env {
            name = "MercadoPago__ClientCredentials"
            value_from {
              secret_key_ref {
                name = var.secret_name
                key  = "mercado-pago-client-credentials"
              }
            }
          }

          env {
            name  = "MercadoPago__UserId"
            value = var.mercado_pago_user_id
          }

          env {
            name  = "MercadoPago__PosId"
            value = var.mercado_pago_pos_id
          }

          env {
            name = "MercadoPago__AccessToken"
            value_from {
              secret_key_ref {
                name = var.secret_name
                key  = "mercado-pago-access-token"
              }
            }
          }

          resources {
            limits = {
              memory = var.memory_limit
              cpu    = var.cpu_limit
            }
            requests = {
              memory = var.memory_request
              cpu    = var.cpu_request
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_deployment" "mckingapipagamento_deployment" {
  metadata {
    name = "mckingapipagamento"
  }

  spec {
    replicas = var.replicas

    selector {
      match_labels = {
        app = "mckingapipagamento-pod"
      }
    }

    template {
      metadata {
        labels = {
          app = "mckingapipagamento-pod"
        }
      }

      spec {
        container {
          name              = "mckingapipagamento-container"
          image             = "ghcr.io/renaneustaquio/mckingapipagamento:latest"
          image_pull_policy = "Always"

          port {
            container_port = var.container_port
          }

          env {
            name  = "ASPNETCORE_ENVIRONMENT"
            value = "Production"
          }

          env {
            name = "ConnectionStrings__DefaultConnection"
            value_from {
              secret_key_ref {
                name = var.secret_name
                key  = "postgres-connection-string"
              }
            }
          }

          env {
            name  = "MercadoPago__UrlBase"
            value = var.mercado_pago_url_base
          }

          env {
            name = "MercadoPago__ClientSecret"
            value_from {
              secret_key_ref {
                name = var.secret_name
                key  = "mercado-pago-client-secret"
              }
            }
          } 
		  
          env {
            name  = "AWS__AccessKeyId"
            value = var.aws_access_key_id
          }

          env {
            name  = "AWS__SecretAccessKey"
            value = var.aws_secret_access_key
          }
		  
          env {
            name  = "AWS__SessionToken"
            value = var.aws_session_token
          }		  
		  
		  env {
			name  = "AWS__Region"
			value = "us-east-1"
		  }  

          env {
            name = "MercadoPago__ClientId"
            value_from {
              secret_key_ref {
                name = var.secret_name
                key  = "mercado-pago-client-id"
              }
            }
          }

          env {
            name = "MercadoPago__ClientCredentials"
            value_from {
              secret_key_ref {
                name = var.secret_name
                key  = "mercado-pago-client-credentials"
              }
            }
          }

          env {
            name  = "MercadoPago__UserId"
            value = var.mercado_pago_user_id
          }

          env {
            name  = "MercadoPago__PosId"
            value = var.mercado_pago_pos_id
          }

          env {
            name = "MercadoPago__AccessToken"
            value_from {
              secret_key_ref {
                name = var.secret_name
                key  = "mercado-pago-access-token"
              }
            }
          }

          resources {
            limits = {
              memory = var.memory_limit
              cpu    = var.cpu_limit
            }
            requests = {
              memory = var.memory_request
              cpu    = var.cpu_request
            }
          }
        }
      }
    }
  }
}
