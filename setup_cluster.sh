#!/bin/bash

set -e

# Google project id
export PROJECTID='carbonplan'

# Kubernetes cluster admin
export EMAIL='joe@carbonplan.org'

# Set up zone and region (see: https://cloud.google.com/compute/docs/regions-zones/)
export ZONE='us-central1-b'

export CLUSTER_NAME='hub'

# create cluster on GCP
gcloud config set project $PROJECTID
gcloud services enable container.googleapis.com  # To enable the Kubernetes Engine API
gcloud container clusters create $CLUSTER_NAME --zone=$ZONE \
    --cluster-version=1.15.11-gke.9 \
    --no-enable-legacy-authorization \
    --enable-autoscaling --max-nodes=2 \
    --enable-autoprovisioning --autoprovisioning-config-file autoprovisioning.json \
    --enable-vertical-pod-autoscaling \
    --enable-autoupgrade --enable-autorepair --max-surge-upgrade=1 \
    --enable-stackdriver-kubernetes

gcloud container clusters get-credentials $CLUSTER_NAME --zone=$ZONE --project $PROJECTID
