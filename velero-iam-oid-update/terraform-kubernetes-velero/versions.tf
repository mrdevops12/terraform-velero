provider "aws" {
 profile = var.aws_profile
}
provider "helm" {
  kubernetes {
        config_path = pathexpand(var.kube_config)
  }
}

provider "kubernetes" {
  config_path = pathexpand(var.kube_config)
}
