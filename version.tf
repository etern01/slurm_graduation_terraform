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
    skip_requesting_account_id  = true
    skip_get_ec2_platforms      = true
    
    dynamodb_endpoint = "https://docapi.serverless.yandexcloud.net/ru-central1/b1g8np9vscpqf0c15ej1/etngu6933nkbuqdd0n9f"
    dynamodb_table = "state-lock-table"
  }

}

provider "yandex" {
  cloud_id = "b1g8np9vscpqf0c15ej1"
  folder_id = "b1gf1q7f6pmbfnld7jtu" 
}
