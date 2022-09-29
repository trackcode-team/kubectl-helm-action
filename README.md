# Docker with Kubectl & Helm

## Build & Push

Change Kubectl or Helm version in Dockerfile:
```sh
ARG KUBE_VERSION=1.25.2
ARG HELM_VERSION=3.10.0
```

Run docker build command and change the tag `3.10.0` to the current Helm version:
```sh
docker build -t trcoapp/docker-kubectl-helm:3.10.0 -f ./Dockerfile .
```

Push you image to Docker Hub:
```sh
docker push -t trcoapp/docker-kubectl-helm:3.10.0
```

> You will find the credentials for the Docker Hub in `1Password`.

## Run

```sh
docker run --env KUBE_CONFIG_BASE64=ab2c224... -it trcoapp/docker-kubectl-helm:3.10.0
```

```sh
docker run -v $(pwd):/data \
 -e KUBE_CONFIG_BASE64=... \
 -it trackcode/docker-kubectl-helm \
 /bin/sh -c "helm template app-pwa ops/chart --namespace lola-222-production --set image.repository=eu.gcr.io/trackcode-186113/lola-web --set image.tag=fb3ba5cbb98f31d5bd3435a1e3d0246aeea14ea0 --values ./ops/deployments/production.yaml > manifest.yaml && kubectl apply manifest.yaml"
```

## Inspired by
* https://github.com/wahyd4/kubectl-helm-action
* https://github.com/dtzar/helm-kubectl