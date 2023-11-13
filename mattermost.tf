resource "helm_release" "mattermost" {
  name       = "mattermost"
  namespace = "default"
  repository = "https://helm.mattermost.com"
  chart      = "mattermost-team-edition"

  values = [
    "${file("matter-value.yml")}"
  ]
}

