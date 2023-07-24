resource "yandex_iam_service_account" "sa-k8s-admin" {
  folder_id = var.folder_id
  name      = "sa-k8s-admin"
}

resource "yandex_resourcemanager_folder_iam_member" "sa-k8s-admin-permissions" {
  folder_id = var.folder_id
  role      = "admin"
  member    = "serviceAccount:${yandex_iam_service_account.sa-k8s-admin.id}"
}

resource "helm_release" "ingress_nginx" {
  name       = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = "4.2.1"
  wait       = true
  set {
    name  = "controller.service.loadBalancerIP"
    value = module.kube.external_v4_address
  }
}
