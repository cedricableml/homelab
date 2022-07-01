#!/usr/bin/env bash
cd ~/dev/homelab/homelab/talos
talhelper genconfig

export TALOSCONFIG=~/dev/homelab/homelab/talos/clusterconfig/talosconfig

talosctl config node "10.250.2.200"; talosctl config endpoint 10.250.2.200 10.250.2.201 10.250.2.202 10.250.2.254

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

echo Sleep..
sleep 120

echo Running bootstrap..
talosctl bootstrap

echo Sleep..
sleep 180

talosctl kubeconfig .
export KUBECONFIG=$(pwd)/kubeconfig

echo kubectl get no
kubectl get no
