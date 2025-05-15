resource "kubernetes_service" "mckingapiproducao_service" {
  metadata {
    name = "mckingapiproducao-service"
    labels = {
      run = "mckingapiproducao"
    }
  }

  spec {
    selector = {
      app = "mckingapiproducao"
    }

    port {
      name        = "http"
      port        = 80
      target_port = 80
      protocol    = "TCP"
    }

    type = "ClusterIP"
  }
}

resource "kubernetes_service" "mckingworkerproducao_service" {
  metadata {
    name = "mckingworkerproducao-service"
    labels = {
      run = "mckingworkerproducao"
    }
  }

  spec {
    selector = {
      app = "mckingworkerproducao"
    }

    port {
      name        = "http"
      port        = 80
      target_port = 80
      protocol    = "TCP"
    }

    type = "ClusterIP"
  }
}

resource "kubernetes_service" "mckingapi_service" {
  metadata {
    name = "mckingapi-service"
    labels = {
      run = "mckingapi"
    }
  }

  spec {
    selector = {
      app = "mckingapi"
    }

    port {
      name        = "http"
      port        = 80
      target_port = 80
      protocol    = "TCP"
    }

    type = "ClusterIP"
  }
}