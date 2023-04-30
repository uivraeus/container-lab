#!/usr/bin/env bash

set -ux

# Fix/adjustment of hardcoded value in the base image .bashrc
sed -i 's/export PROMPT_DIRTRIM=4/export PROMPT_DIRTRIM=1/g' /home/vscode/.bashrc

# Ensure that the k3d cluster exists
k3d cluster start mycluster 2>/dev/null || k3d cluster create mycluster --registry-create myregistry:127.0.0.1:1234 || echo 'Proceeding anyway'
