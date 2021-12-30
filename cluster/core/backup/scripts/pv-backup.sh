#!/usr/bin/env bash
set -euo pipefail

#curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
#chmod +x kubectl
#mv kubectl /usr/local/bin/
#curl -LO "https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64"
#chmod +x jq-linux64
#mv jq-linux64 /usr/local/bin/jq
curl -LO "https://github.com/utkuozdemir/pv-migrate/releases/download/v0.8.1/pv-migrate_v0.8.1_linux_x86_64.tar.gz"
tar xvf pv-migrate*
mv pv-migrate /usr/local/bin/

dest_ns="${DESTINATION_NAMESPACE}"
dest_pvc_name="${DESTINATION_PVC_NAME}"

# get all pvcs that match the label pv-backup/enabled=true
source_ns_pvcs=$(kubectl get pvc --all-namespaces -l pv-backup/enabled=true -o=json | jq -c '.items[] | {name: .metadata.name, namespace: .metadata.namespace}')

for ns_pvc in $source_ns_pvcs; do
  source_pvc_name=$(jq -r '.name'<<<"$ns_pvc")
  source_pvc_ns=$(jq -r '.namespace'<<<"$ns_pvc")

  # get the associated deployment for this pvc
  deploy_details=$(kubectl get deploy --all-namespaces -o=json | \
    jq --arg pvc "$source_pvc_name" -c '.items[] | {name: .metadata.name, namespace: .metadata.namespace, claimName: .spec.template.spec |  select( has ("volumes") ).volumes[] | select( has ("persistentVolumeClaim") ).persistentVolumeClaim.claimName } | select(.claimName==$pvc)')
  deploy_name=$(jq -r '.name'<<<"$deploy_details")
  deploy_ns=$(jq -r '.namespace'<<<"$deploy_details")

  # scale down the deployment so we can mount the PVC later
  kubectl scale -n "$deploy_ns" "$deploy_name" --replicas=0

  # wait for the deployment to successfully scale down
  # shellcheck disable=SC2046
  while [ $(kubectl get po -l app.kubernetes.io/name="$deploy_name" -n "$deploy_ns" -ojson | jq -r '.items | length') -ne 0 ]; do
    sleep 1
  done

  # copy from source pvc to dest pvc
  pv-migrate migrate --source-namespace "$source_pvc_ns" --dest-namespace "$dest_ns" --dest-path /"$deploy_name" "$dest_pvc_name" "$dest_pvc_name"

  # scale deployment back up; blindly do not wait so we can move on to the next backup
  # TODO: maybe wait in background?
  kubectl scale -n "$deploy_ns" "$deploy_name" --replicas=1
done
