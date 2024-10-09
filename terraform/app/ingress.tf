resource "kubernetes_ingress_v1" "example" {
  metadata {
    name      = "example-ingress"
    namespace = "default"
    annotations = {
      "kubernetes.io/ingress.class"                             = "alb"
      "alb.ingress.kubernetes.io/scheme"                        = "internet-facing"
      "alb.ingress.kubernetes.io/target-type"                   = "ip"
      "alb.ingress.kubernetes.io/healthcheck-path"              = "/"
      "alb.ingress.kubernetes.io/healthcheck-port"              = "80"
      "alb.ingress.kubernetes.io/healthcheck-interval-seconds"  = "30"
      "alb.ingress.kubernetes.io/healthcheck-timeout-seconds"   = "5"
      "alb.ingress.kubernetes.io/healthcheck-healthy-threshold" = "2"
      "alb.ingress.kubernetes.io/healthcheck-unhealthy-threshold" = "2"
    }
  }

  spec {
    rule {
      http {
        path {
          path      = "/"
          path_type = "Prefix"

          backend {
            service {
              name = kubernetes_service_v1.my_project_service.metadata[0].name
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}
