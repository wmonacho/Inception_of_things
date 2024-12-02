sudo helm repo add gitlab https://charts.gitlab.io/
sudo helm repo update
sudo helm upgrade --install gitlab gitlab/gitlab --timeout 600s -f gitlab_values.yaml -n gitlab --debug