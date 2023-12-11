variable "kubernetes_cluster_id" {
  type        = string
  description = "Kubernetes Cluster ID"
}

variable "kubernetes_cluster_cert_data" {
  type        = string
  description = "Kubernetes Cluster Certificate data"
}

variable "kubernetes_cluster_endpoint" {
  type        = string
  description = "Kubernetes Cluster address"
}

variable "kubernetes_cluster_name" {
  type        = string
  description = "Kubernetes Cluster name"
}

variable "eks_nodegroup_id" {
  type        = string
  description = "EKS Nodegroup ID"
}
