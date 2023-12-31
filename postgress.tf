resource "yandex_mdb_postgresql_cluster" "this" {
  name                = "yelb-db"
  environment         = "PRESTABLE"
  network_id          = yandex_vpc_network.this.id
  deletion_protection = false

  config {
    version = 11
    access {
      web_sql = true
    }
    resources {
      resource_preset_id = "s2.micro"
      disk_type_id       = "network-ssd"
      disk_size          = "20"
    }
  }

  host {
    zone      = "ru-central1-a"
    name      = "mypg-host-a"
    subnet_id = yandex_vpc_subnet.this["ru-central1-a"].id
    assign_public_ip = true
  }

}


resource "yandex_mdb_postgresql_user" "prod" {
  cluster_id = yandex_mdb_postgresql_cluster.this.id
  name       = var.pg_user
  password   = var.pg_password
}

resource "yandex_mdb_postgresql_user" "dev" {
  cluster_id = yandex_mdb_postgresql_cluster.this.id
  name       = "yelbduserdev"
  password   = "yelbduserdev"
}

resource "yandex_mdb_postgresql_database" "yelbdatabase" {
  cluster_id = yandex_mdb_postgresql_cluster.this.id
  name       = var.pg_dbname
  owner      = var.pg_user
  depends_on = [ yandex_mdb_postgresql_user.prod ]
}

resource "yandex_mdb_postgresql_database" "yelbdatabasedev" {
  cluster_id = yandex_mdb_postgresql_cluster.this.id
  name       = "yelbdatabasedev"
  owner      = "yelbduserdev"
  depends_on = [ yandex_mdb_postgresql_user.dev ]
}