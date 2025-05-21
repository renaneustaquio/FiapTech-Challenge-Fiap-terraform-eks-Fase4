resource "kubernetes_ingress_v1" "mckingapiproducao_ingress" {
  metadata {
    name = "mckingapiproducao-ingress"
    annotations = {
      "nginx.ingress.kubernetes.io/rewrite-target" = "/"
    }
  }

  spec {
    rule {
      http {
        path {
          path     = "/mckingapiproducao"
          path_type = "Prefix"
          backend {
            service {
              name = "mckingapiproducao-service"
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_ingress_v1" "mckingworkerproducao_ingress" {
  metadata {
    name = "mckingworkerproducao-ingress"
    annotations = {
      "nginx.ingress.kubernetes.io/rewrite-target" = "/"
    }
  }

  spec {
    rule {
      http {
        path {
          path     = "/mckingworkerproducao"
          path_type = "Prefix"
          backend {
            service {
              name = "mckingworkerproducao-service"
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_ingress_v1" "mckingapi_ingress" {
  metadata {
    name = "mckingapi-ingress"
    annotations = {
      "nginx.ingress.kubernetes.io/rewrite-target" = "/"
    }
  }

  spec {
    rule {
      http {
        path {
          path     = "/mckingapi"
          path_type = "Prefix"
          backend {
            service {
              name = "mckingapi-service"
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_ingress_v1" "mckingapipagamento_ingress" {
  metadata {
    name = "mckingapipagamento-ingress"
    annotations = {
      "nginx.ingress.kubernetes.io/rewrite-target" = "/"
    }
  }

  spec {
    rule {
      http {
        path {
          path     = "/mckingapipagamento"
          path_type = "Prefix"
          backend {
            service {
              name = "mckingapipagamento-service"
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}