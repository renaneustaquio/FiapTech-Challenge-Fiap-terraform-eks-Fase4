resource "kubernetes_service" "mckingworkerproducao_service" {
  metadata {
    name = "mckingworkerproducao-service"
  }

  spec {
    selector = {
      app = "mckingworkerproducao-pod"
    }

    port {
      name        = "http"
      port        = 80
      target_port = 8080
    }

    type = "LoadBalancer"
  }
}


resource "kubernetes_service" "mckingapiproducao_service" {
  metadata {
    name = "mckingapiproducao-service"
  }

  spec {
    selector = {
      app = "mckingapiproducao-pod"
    }

    port {
      name        = "http"
      port        = 80
      target_port = 8080
    }

    type = "LoadBalancer"
  }
}


resource "kubernetes_service" "mckingapi_service" {
  metadata {
    name = "mckingapi-service"
  }

  spec {
    selector = {
      app = "mckingapi-pod"
    }

    port {
      name        = "http"
      port        = 80
      target_port = 8080
    }

    type = "LoadBalancer"
  }
}
