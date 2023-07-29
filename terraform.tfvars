folder_id = "b1gsaq4k3di2ruop4vll"
cloud_id = "b1g8np9vscpqf0c15ej1"
ipv4_cidr_blocks = [["10.10.0.0/24"], ["10.10.1.0/24"], ["10.10.2.0/24"]]
labels = {
  "project" = "slurm"
}

cluster_name         = "kube-cluster"
cluster_version      = "1.23"
description          = "Kubernetes practice cluster"
public_access        = true
create_kms           = true
enable_cilium_policy = true

kms_key = {
  name = "kube-regional-kms-key"
}

master_labels = {
  environment = "dev"
  owner       = "example"
  role        = "master"
  service     = "kubernetes"
}

dns_domain = "s015605.site"

pg_user = "yelbduser"
pg_password = "yelbduser"