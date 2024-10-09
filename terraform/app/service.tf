# app/service.tf

resource "kubernetes_service_v1" "my_project_service" {
  metadata {
    name      = "my-project-service"
    namespace = "default"
  }

  spec {
    selector = {
      app = "my-project-app"
    }

    port {
      protocol    = "TCP"
      port        = 80      # Port exposed by the service
      target_port = 5000    # Port your container is listening on
    }

    type = "ClusterIP"      # Service type is ClusterIP
  }
}
