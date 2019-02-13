Mesh expansion test suites setup a GKE cluster and GCE VMs to test Istio mesh expansion feature.

To setup the environment and deploy BookInfo app in GKE cluster and GCE VM.

```
RELEASE="release-1.1-20190209-09-16" proj="your-gcp-project" \
zone="us-central1-a" cluster="gke-cluster-name" gce_name="gc" \
  ./setup.sh setup
```

This will create two GKE clusters with IP aliasing enabled and install Istio
accordingly in each cluster. And finally deploy BookInfo app in two clusters.

To tear down the clusters and clean up the resources.

```
RELEASE="release-1.1-20190209-09-16" proj="your-gcp-project" \
zone="us-central1-a" cluster="gke-cluster-name" gce_name="gc" \
  ./setup.sh cleanup
```
