# Kubectl Helm Action

Composite action to easily apply helm charts with kubectl.

> This project is developed exclusively for TrackCode.

## Example
```yaml
- uses: trackcode-team/kubectl-helm-action@v1
  with:
    name: app-web
    chart: ops/chart
    namespace: app-web-production
    values: ops/deployments/production.yaml
    image-repository: eu.gcr.io/trackcode-xxxxxx/app-web
    image-tag: 001908c7d2ed95f1af93c9a2d0afe65d206645ef
    kube-config: ${{ secrets.KUBE_CONFIG_PRODUCTION }} # Kubeconfig YAML
    apply: true # default is false
```
