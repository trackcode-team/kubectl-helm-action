#!/bin/bash

: "${KUBE_CONFIG_BASE64?Must be specified}"

# Extract the base64 encoded config data and write this to the KUBECONFIG
echo "$KUBE_CONFIG_BASE64" | base64 -d > /tmp/config

export KUBECONFIG=/tmp/config

# Exec the CMD from Dockerfile (can be overriden through Docker/K8s)
exec "${@:1}"