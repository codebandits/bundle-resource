#!/usr/bin/env sh

export KAPP_KUBECONFIG=$(pwd)/kubeconfig
export GOOGLE_APPLICATION_CREDENTIALS=$(pwd)/../development/secrets/tools-275701.json

kustomize build secrets | \
    kapp deploy \
    --namespace apps \
    --app brite-tank-bundle-resource \
    --yes \
    -f -
