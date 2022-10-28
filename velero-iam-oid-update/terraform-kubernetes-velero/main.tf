resource "kubernetes_namespace" "this" {

  metadata {
    name = local.namespace_name

    labels = {
      name        = local.namespace_name
      description = var.description
    }
  }
}

# Retrieving this data will ensure that the target Kubernetes namespace exists
# before proceeding.
data "kubernetes_namespace" "this" {
  metadata {
    name = local.namespace_name
  }

  depends_on = [
    kubernetes_namespace.this,
  ]
}

