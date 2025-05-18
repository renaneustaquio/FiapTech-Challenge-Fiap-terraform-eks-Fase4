module "aws_eks" {
  source = "./module/aws_eks"

  vpc_id            = data.aws_vpc.mcking_vpc.id
  subnet_ids        = local.subnet_todas_ids
  security_group_id = data.aws_security_group.mcking_security_group_rds.id
}

module "kubernetes" {
  source = "./module/kubernetes"

  mcking_cluster                  = module.aws_eks.mcking_cluster
  subnet_ids                      = local.subnet_privadas_ids
  security_group_id               = data.aws_security_group.mcking_security_group.id
  mercado_pago_client_id          = var.mercado_pago_client_id
  mercado_pago_client_secret      = var.mercado_pago_client_secret
  mercado_pago_client_credentials = var.mercado_pago_client_credentials
  mercado_pago_access_token       = var.mercado_pago_access_token
  postgres_connection_string      = data.aws_secretsmanager_secret_version.aws_secretsmanager_secret_version_teste_4.secret_string
  aws_access_key_id     = var.aws_access_key_id
  aws_secret_access_key = var.aws_secret_access_key
  aws_session_token     = var.aws_session_token
  fila_pedidos_url      = var.fila_pedidos_url 
  aws_cognito_user_pool_id = var.aws_cognito_user_pool_id
}