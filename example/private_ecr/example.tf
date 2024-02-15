provider "aws" {
  region = "us-west-2"
}

locals {
  name        = "private-ecr"
  environment = "test"
}
#==========================================================================
#module =private_ecr
#==========================================================================
module "private_ecr" {
  source             = "./../../"
  enable_private_ecr = true
  name               = local.name
  environment        = local.environment
  scan_on_push       = true
  max_image_count    = 7
}
