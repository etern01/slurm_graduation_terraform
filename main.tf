module "kube" {
  source     = "./modules/terraform-yc-kubernetes"
  network_id = yandex_vpc_network.this.id

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
      fixed_scale   = {
        size = 3
      }
      node_labels   = {
        role        = "worker-01"
        environment = "testing"
      }
    },
    
  }
}
