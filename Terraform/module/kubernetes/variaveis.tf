######### Variáveis de Deployment #########
variable "deployment_name" {
  type    = string
  default = "mckingapi-deployment"
}

variable "pod_name" {
  type    = string
  default = "mckingapi-pod"
}

variable "container_name" {
  type    = string
  default = "mckingapi-container"
}

variable "container_port" {
  type    = number
  default = 8080
}

variable "image" {
  type    = string
  default = "ghcr.io/renaneustaquio/mckingapi:latest"
}

variable "replicas" {
  type    = number
  default = 1
}

variable "cpu_limit" {
  type    = string
  default = "500m"
}

variable "cpu_request" {
  type    = string
  default = "250m"
}

variable "memory_limit" {
  type    = string
  default = "512Mi"
}

variable "memory_request" {
  type    = string
  default = "256Mi"
}

######### Variáveis Secrets #########
variable "secret_name" {
  type    = string
  default = "mckingapi-secrets"
}

variable "github_registry_name" {
  type    = string
  default = "github-registry-secret"
}

variable "mercado_pago_url_base" {
  type    = string
  default = "https://api.mercadopago.com/"
}

variable "mercado_pago_user_id" {
  type    = string
  default = "2198134554"
}

variable "mercado_pago_pos_id" {
  type    = string
  default = "PMCK002"
}

variable "mercado_pago_client_id" {
  type      = string
  default   = ""
  sensitive = true
}

variable "mercado_pago_client_secret" {
  type      = string
  default   = ""
  sensitive = true
}

variable "mercado_pago_client_credentials" {
  type      = string
  default   = ""
  sensitive = true
}

variable "mercado_pago_access_token" {
  type      = string
  default   = ""
  sensitive = true
}

variable "postgres_connection_string" {
  type        = string
  default     = ""
  description = "Connection string for PostgreSQL"
}

######### Cluster #########
variable "mcking_cluster" {
  type = any
}

######### Kubernetes Service#########
variable "service_name" {
  type    = string
  default = "mckingapi-service"
}

variable "service_label" {
  type    = string
  default = "mckingapi-service"
}

variable "service_port" {
  type    = number
  default = 80
}

variable "service_type" {
  type    = string
  default = "LoadBalancer"
}

variable "subnet_ids" {
  description = "IDs das subnets"
  type        = list(string)
}

variable "security_group_id" {
  description = "ID do security group"
  type        = any
}

variable "aws_access_key_id" {
  type        = string
  description = "AWS Access Key ID"
}

variable "aws_secret_access_key" {
  type        = string
  description = "AWS Secret Access Key"
}

variable "aws_session_token" {
  type        = string
  description = "AWS Session Token (opcional)"
  default     = ""
}

variable "fila_pedidos_url" {
  type        = string
  description = "URL da fila de pedidos (SQS)"
}

variable "aws_cognito_user_pool_id" {
  type        = string
  description = "Cognito da sessão de acesso da AWS"
}