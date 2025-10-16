//
//     MySQL Operator  -  Install Operator and initial cluster
//


locals {
  // Multi-doc YAML files:
  mysql_crds_url      = "https://raw.githubusercontent.com/mysql/mysql-operator/9.4.0-2.2.5/deploy/deploy-crds.yaml"
  mysql_operator_url  = "https://raw.githubusercontent.com/mysql/mysql-operator/9.4.0-2.2.5/deploy/deploy-operator.yaml"
  // Manifests
  mysql_crd_manifests = provider::kubernetes::manifest_decode_multi(data.http.mysql_crd_yaml.response_body)
  mysql_crd_manifests = provider::kubernetes::manifest_decode_multi(data.http.mysql_operator_yaml.response_body)
}

data "http" "mysql_crd_yaml" {
  url = local.mysql_crds_url
}

data "http" "mysql_operator_yaml" {
  url = local.mysql_operator_url
}

resource "kubernetes_manifest" "mysql_crds_east" {
  provider  = kubernetes.talos-proxmox-east
  for_each = {
    for i in provider::kubernetes::manifest_decode_multi(data.http.mysql_crd_yaml.response_body) : "${i.kind}-${i.metadata.name}-${lookup(i.metadata, "namespace","default")}" => i
  }
  manifest = each.value
}
resource "kubernetes_manifest" "mysql_operator_east" {
  provider  = kubernetes.talos-proxmox-east
  for_each = {
    for i in provider::kubernetes::manifest_decode_multi(data.http.mysql_operator_yaml.response_body) : "${i.kind}-${i.metadata.name}-${lookup(i.metadata, "namespace","default")}" => i
  }
  manifest = each.value
}
