module "kube" {
  source     = "./modules/kubernetes"
  network_id = yandex_vpc_network.this.id
  public_access = true
  enable_default_rules = false

  master_locations = [for subnet in yandex_vpc_subnet.this : {
    subnet_id = subnet.id
    zone      = subnet.zone
  }]


  master_maintenance_windows = [
    {
      day        = "monday"
      start_time = "23:00"
      duration   = "3h"
    }
  ]

  node_groups = {
    "yc-k8s-ng-01" = {
      description  = "Kubernetes nodes group 01"
      node_cores    = 2
      node_memory   = 2
      core_fraction = 50
      fixed_scale   = {
        size = 3
      }
      master_locations = [for subnet in yandex_vpc_subnet.this : {
        subnet_id = subnet.id
        zone      = subnet.zone
      }]
      node_labels   = {
        role        = "worker-01"
        environment = "testing"
      }
      nat = true
    },
    "yc-k8s-ingress" = {
      description  = "Kubernetes nodes ingress"
      node_cores    = 2
      node_memory   = 2
      core_fraction = 50
      fixed_scale   = {
        size = 1
      }
      master_locations = [for subnet in yandex_vpc_subnet.this : {
        subnet_id = subnet.id
        zone      = subnet.zone
      }]
      node_labels   = {
        role        = "ingress"
        environment = "testing"
      }
      nat = true
    }
    
  }
}
