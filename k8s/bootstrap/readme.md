# Bootstrap

## Flux

### Install Flux

```sh
kubectl apply --server-side --kustomize ./k8s/bootstrap
```

### Apply Cluster Configuration

```sh
sops -d k8s/bootstrap/age-key.sops.yaml | kubectl apply -f -
sops -d k8s/bootstrap/github-deploy-key.sops.yaml | kubectl apply -f -
sops -d k8s/flux/vars/global-secrets.yaml | kubectl apply -f -
kubectl apply -f k8s/flux/vars/global-vars.yaml
```

### Kick off Flux applying this repository

```sh
kubectl apply --server-side --kustomize ./k8s/flux/config
```
