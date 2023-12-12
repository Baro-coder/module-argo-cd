provider "kubernetes" {
  cluster_ca_certificate = base64decode(var.kubernetes_cluster_cert_data)
  host                   = var.kubernetes_cluster_endpoint
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args        = [
      "--region",
      "${var.aws_region}",
      "eks",
      "get-token",
      "--cluster-name",
      "${var.kubernetes_cluster_name}",
      "--output",
      "json",
    ]
  }
}

provider "helm" {
  kubernetes {
    cluster_ca_certificate = base64decode(var.kubernetes_cluster_cert_data)
    host                   = var.kubernetes_cluster_endpoint
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      command     = "aws"
      args        = [
        "--region",
        "${var.aws_region}",
        "eks",
        "get-token",
        "--cluster-name",
        "${var.kubernetes_cluster_name}",
        "--output",
        "json",
      ]
    }
  }
}

resource "kubernetes_namespace" "example" {
  metadata {
    name = "argo"
  }
}

resource "helm_release" "argocd" {
  name       = "bs-msur"
  chart      = "argo-cd"
  repository = "https://argoproj.github.io/argo-helm"
  namespace  = "argo"
}