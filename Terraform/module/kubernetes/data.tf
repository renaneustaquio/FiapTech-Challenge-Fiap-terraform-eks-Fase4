data "aws_iam_role" "mcking_role" {
  name = "LabRole"
}

data "aws_cognito_user_pools" "mcking_user_pools" {
  name = "mckingapi-user-pool"
}

data "aws_cognito_user_pool" "mcking_user_pool" {
  user_pool_id = data.aws_cognito_user_pools.mcking_user_pools.ids[0]
}
