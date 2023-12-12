resource "kubernetes_ingress_v1" "mattermost-ingress" {
  wait_for_load_balancer = true
  metadata {
    name = "mattermost-ingress"
    namespace = "default"
    annotations = {
        "alb.ingress.kubernetes.io/load-balancer-name" = "mattermost"
        "alb.ingress.kubernetes.io/scheme"             = "internet-facing"
        "alb.ingress.kubernetes.io/target-type"        = "ip"                                       
        "alb.ingress.kubernetes.io/certificate-arn" = "arn:aws:acm:us-west-2:083772204804:certificate/58e604e3-40aa-4644-b0ad-8663f8e67c2a"
  }
  }
  spec {
    ingress_class_name = "alb"
    default_backend {
      service {
        name = "mattermost-team-edition"
        port {
          number = 80
        }
      }
    }
  }
}

##NGINX

#resource "kubernetes_ingress_v1" "mattermost-ingress" {
#  wait_for_load_balancer = true
#  metadata {
#    name = "mattermost"
#    namespace = "default"
#    annotations = {
#        "cert-manager.io/cluster-issuer" = "mattermost-issuer"
#  }
#  }
#  spec {
#    ingress_class_name = "nginx"
#    tls {
#      secret_name = "mattermost-secret"
#      hosts = ["matter.devopsnetwork.net"] 
#    }
#    rule {
#      host = "matter.devopsnetwork.net"  
#      http {
#        path {
#          path = "/"
#          backend {
#            service {
#              name = "mattermost-team-edition"
#              port {
#                number = 80
#              }
#            }
#          }
#        }
#      }
#    }
#  }
#}
