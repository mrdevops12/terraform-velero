

resource "helm_release" "this" {
  count = var.app_deploy ? 1 : 0

  name       = var.name
  chart      = var.name
  namespace  = local.namespace
  repository = var.repository

  force_update  = lookup(var.app, "force_update", true)
  wait          = lookup(var.app, "wait", true)
  recreate_pods = lookup(var.app, "recreate_pods", true)
  max_history   = lookup(var.app, "max_history", 1)
  lint          = lookup(var.app, "lint", true)
  version       = lookup(var.app, "version", "2.13.2")

  values = concat(
    tolist([
      templatefile("${path.module}/charts/velero/values.yaml", {
        EKS_ROLE_ARN = aws_iam_role.this[0].arn
        AWS_S3_BUCKET =  var.bucket 
        AWS_REGION    = var.region
        VELERO_SCHEDULE = var.schedule
      }),
    ]),
  )
}
