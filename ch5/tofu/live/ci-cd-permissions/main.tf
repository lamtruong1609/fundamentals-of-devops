provider "aws" {
  region = "us-west-2"
}



module "oidc_provider" {
  source = "../../modules/github-aws-oidc"
  provider_url = "https://token.actions.githubusercontent.com"
}
module "iam_roles" {
  source = "../../modules/gh-actions-iam-roles"

  name = "lambda-sample"
  oidc_provider_arn = module.oidc_provider.oidc_provider_arn

  enable_iam_role_for_testing = true
  enable_iam_role_for_plan  = true
  enable_iam_role_for_apply = true

  github_repo = "lamtruong1609/fundamentals-of-devops"
  lambda_base_name = "lambda-sample"

  tofu_state_bucket         = "fundamentals-of-devsecops-tofu-state"
  tofu_state_dynamodb_table = "fundamentals-of-devsecops-tofu-state"
}