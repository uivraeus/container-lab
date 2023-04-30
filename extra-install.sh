#!/usr/bin/env bash

set -euxo pipefail

# podman
apt update && apt install -y podman

# helm
curl -sSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# kubectl
curl -sSL "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" -o /usr/local/bin/kubectl && chmod +x /usr/local/bin/kubectl

# yq
curl -sSL https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -o /usr/local/bin/yq && chmod +x /usr/local/bin/yq

# fix/adjustment of hardcoded value in the base image .bashrc
sed -i 's/export PROMPT_DIRTRIM=4/export PROMPT_DIRTRIM=1/g' /home/vscode/.bashrc