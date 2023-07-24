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
  data    = [module.kube.external_v4_address]
}
