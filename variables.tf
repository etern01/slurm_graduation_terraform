variable "folder_id" {
  type        = string
  description = "folder id"

}

variable "cloud_id" {
  type        = string
  description = "cloud id"

}
variable "labels" {
  type = map(string)

}

variable "az" {
  type    = list(string)
  default = ["ru-central1-a", "ru-central1-b", "ru-central1-c"]

}

variable "ipv4_cidr_blocks" {
  type        = list(list(string))
  description = "List of ipv4"

}



variable "dns_domain" {
  type        = string
  description = "Domain name"

}

variable "pg_user" {
  type        = string
  description = "Postgress user"

}


variable "pg_password" {
  type        = string
  description = "Postgres password"

}


variable "pg_dbname" {
  type        = string
  description = "pg database name"
}