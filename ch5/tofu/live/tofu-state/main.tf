provider "aws" {
  region = "us-west-2"
}

module "state" {
  source = "github.com/brikis98/devops-book//ch5/tofu/modules/state-bucket"
  # TODO: fill in your own bucket name!
  name = "fundamentals-of-devsecops-tofu-state"
}