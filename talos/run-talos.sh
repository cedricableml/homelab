#!/usr/bin/env bash
cd ~/dev/homelab/homelab/talos
talhelper genconfig

export TALOSCONFIG=~/dev/homelab/homelab/talos/clusterconfig/talosconfig

talosctl config node "10.250.2.200"; talosctl config endpoint "10.250.2.200"

echo Applying master..
talosctl apply-config --insecure --nodes 10.250.2.200 --file clusterconfig/homelab-talos-0-homelab-talos-0-controlplane-0.yaml
talosctl apply-config --insecure --nodes 10.250.2.201 --file clusterconfig/homelab-talos-0-homelab-talos-0-controlplane-1.yaml
talosctl apply-config --insecure --nodes 10.250.2.202 --file clusterconfig/homelab-talos-0-homelab-talos-0-controlplane-2.yaml

echo Applying worker..
talosctl apply-config --insecure --nodes 10.250.2.210 --file clusterconfig/homelab-talos-0-homelab-talos-0-worker-0.yaml
talosctl apply-config --insecure --nodes 10.250.2.211 --file clusterconfig/homelab-talos-0-homelab-talos-0-worker-1.yaml
talosctl apply-config --insecure --nodes 10.250.2.212 --file clusterconfig/homelab-talos-0-homelab-talos-0-worker-2.yaml
talosctl apply-config --insecure --nodes 10.250.2.213 --file clusterconfig/homelab-talos-0-homelab-talos-0-worker-3.yaml
talosctl apply-config --insecure --nodes 10.250.2.214 --file clusterconfig/homelab-talos-0-homelab-talos-0-worker-4.yaml

echo Sleep 150..
sleep 150

echo Running bootstrap..
talosctl bootstrap

talosctl kubeconfig .
export KUBECONFIG=./kubeconfig

echo kubectl get no
kubectl get no