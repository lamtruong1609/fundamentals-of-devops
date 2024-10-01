provider "aws" {
  region = "us-west-2"
}
terraform {
  backend "s3" {
    # TODO: fill in your own bucket name here!
    bucket  = "fundamentals-of-devsecops-tofu-state"
    key     = "ch5/tofu/live/lambda-sample"
    region  = "us-west-2"
    encrypt = true
    # TODO: fill in your own DynamoDB table name here!
    dynamodb_table = "fundamentals-of-devsecops-tofu-state"
  }
}
module "function" {
  source = "github.com/brikis98/devops-book//ch3/tofu/modules/lambda"

  name = var.name

  src_dir = "${path.module}/src"
  runtime = "nodejs20.x"
  handler = "index.handler"

  memory_size = 128
  timeout     = 5

  environment_variables = {
    NODE_ENV = "production"
  }

}

module "gateway" {
  source = "github.com/brikis98/devops-book//ch3/tofu/modules/api-gateway"

  name               = var.name
  function_arn       = module.function.function_arn
  api_gateway_routes = ["GET /"]
}
