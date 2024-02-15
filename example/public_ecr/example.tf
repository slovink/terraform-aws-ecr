provider "aws" {
  region = "us-west-2"
}

locals {
  name        = "public_ecr"
  environment = "test"
}

module "public_ecr" {
  source                   = "./../../"
  enable_public_ecr        = true
  name                     = local.name
  environment              = local.environment
  max_untagged_image_count = 1
  max_image_count          = 7
  public_repository_catalog_data = {
    description       = "Docker container for some things"
    operating_systems = ["Linux"]
    architectures     = ["x86"]
  }
}
