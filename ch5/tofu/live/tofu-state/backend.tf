terraform {
  backend "s3" {
    # TODO: fill in your own bucket name here!
    bucket         = "fundamentals-of-devsecops-tofu-state"
    key            = "ch5/tofu/live/tofu-state"
    region         = "us-west-2"
    encrypt        = true
    # TODO: fill in your own DynamoDB table name here!
    dynamodb_table = "fundamentals-of-devsecops-tofu-state"
  }
}