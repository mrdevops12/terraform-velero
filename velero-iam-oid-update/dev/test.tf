    module "velero" {
    source  = "../terraform-kubernetes-velero/"

    aws_profile                = "default"
    namespace_deploy            = "true"
    app_deploy                  = "true"
    cluster_name                = "test-eks"
    openid_connect_provider_uri = "oidc.eks.us-east-2.amazonaws.com/id/08DEFC661217DC067E03AE2D6F1F6836"
    bucket                      = "ve-test-12345"
    schedule                    = "0/5 * * * *"
    region                      = "us-east-2"
  }
