resource "yandex_iam_service_account" "this" {
  name        = "tf"
  description = "service account to manage VMs"
  folder_id   = var.folder_id

}
resource "yandex_resourcemanager_folder_iam_binding" "this" {
  folder_id = var.folder_id

  role = "editor"

  members = [
    "serviceAccount:${yandex_iam_service_account.this.id}",
  ]
}