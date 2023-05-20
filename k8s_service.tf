resource "kubernetes_service" "example" {
  metadata {
    name = "example"
  }
  spec {
    selector = {
      App = kubernetes_deployment.example.metadata.0.labels.App
    }
    port {
      port        = 80
      target_port = 8080
    }

    type = "LoadBalancer"
  }
}