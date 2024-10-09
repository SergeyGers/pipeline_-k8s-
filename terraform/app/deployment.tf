# app/deployment.tf

resource "kubernetes_deployment_v1" "my_project_deployment" {
  metadata {
    name      = "my-project-deployment"
    namespace = "default"
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "my-project-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "my-project-app"
        }
      }

      spec {
        container {
          name  = "my-project-app"
          image = "141330218853.dkr.ecr.us-east-1.amazonaws.com/bank-leumi-project-app:latest"
          port {
            container_port = 5000  # Correct block is 'port', not 'ports'
          }
        }
      }
    }

    strategy {
      rolling_update {
        max_surge       = 1
        max_unavailable = 1
      }
      type = "RollingUpdate"
    }
  }
}
