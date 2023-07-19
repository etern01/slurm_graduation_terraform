resource "yandex_vpc_network" "this" {
  name      = "${local.prefix}network"
  folder_id = var.folder_id

}

resource "yandex_vpc_subnet" "this" {
  folder_id      = var.folder_id
  for_each       = toset(var.az)
  name           = "${local.prefix}network-${each.value}"
  zone           = each.value
  network_id     = yandex_vpc_network.this.id
  v4_cidr_blocks = var.ipv4_cidr_blocks[index(var.az, each.value)]
  labels         = var.labels
}