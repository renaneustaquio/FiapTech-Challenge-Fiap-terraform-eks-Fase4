resource "null_resource" "helm_metrics_repo" {
  provisioner "local-exec" {
    command = <<EOT
      helm repo add --force-update metrics-server https://kubernetes-sigs.github.io/metrics-server
      helm repo update
    EOT
  }
}

resource "helm_release" "metrics_server" {
  name       = "metrics-server"
  namespace  = "kube-system"
  repository = "https://kubernetes-sigs.github.io/metrics-server"
  chart      = "metrics-server"
  version    = "3.12.2"

  values = [
    <<-EOT
    apiVersion: v1
    kind: ConfigMap
    metadata:
      name: metrics-server-config
    data:
      metrics-server.conf: |
        --kubelet-insecure-tls
    EOT
  ]
}