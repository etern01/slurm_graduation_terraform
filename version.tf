terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "tf-state-alexandr"
    region     = "ru-central1"
    key        = "tf.tfstate"
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    
    #dynamodb_endpoint = "https://docapi.serverless.yandexcloud.net/ru-central1/b1g8np9vscpqf0c15ej1/etngu6933nkbuqdd0n9f"
    #dynamodb_table = "state-lock-table"
  }

}

provider "yandex" {
  service_account_key_file = file("/tmp/sa-key.json")
  cloud_id = "b1g8np9vscpqf0c15ej1"
  folder_id = "b1gsaq4k3di2ruop4vll" 
}

data "yandex_client_config" "client" {}

data "yandex_kubernetes_cluster" "kubernetes" {
  name = module.kube.cluster_name
}

provider "kubernetes" {

  host                   = module.kube.external_v4_address
  cluster_ca_certificate = module.kube.cluster_ca_certificate
  token                  = data.yandex_client_config.client.iam_token
}


provider "helm" {
  kubernetes {
    #load_config_file = false

    host                   = module.kube.external_v4_address
    cluster_ca_certificate = module.kube.cluster_ca_certificate
    token                  = data.yandex_client_config.client.iam_token
  }
}
