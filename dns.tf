data "kubernetes_service" "this" {
  metadata {
    name = "ingress-nginx-controller"
  }
}

resource "yandex_dns_zone" "this" {
  name   = replace(var.dns_domain, ".", "-")
  zone   = join("", [var.dns_domain, "."])
  public = true
}

resource "yandex_dns_recordset" "this" {
  zone_id = yandex_dns_zone.this.id
  name    = join("", [var.dns_domain, "."])
  type    = "A"
  ttl     = 200
  data    = [data.kubernetes_service.this.status[0].load_balancer[0].ingress[0].ip]
}
