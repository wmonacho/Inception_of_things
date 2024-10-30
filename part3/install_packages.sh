apt-get update -y
apt-get install net-tools
apt-get install curl
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

#Install K3d
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
$ sudo chmod +x /usr/local/bin/k3d

#Create Cluster pee3
sudo k3d cluster create pee3


curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
rm argocd-linux-amd64

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

#Create Namespaces Dev and Argo
sudo kubectl create namespace dev
sudo kubectl create namespace argocd

#install Argo CD
sudo kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# sudo argocd admin initial-password -n argocd
#PassWord Admin argocd
# ZJeSVYYZslh9-BQp

#voir les pods et leurs status
#sudo kubectl get pod -n (namespace)

#sudo kubectl cluster-info

#sudo kubectl port-forward svc/argocd-server -n argocd 8080:443