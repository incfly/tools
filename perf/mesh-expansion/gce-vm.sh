# This script is supposed to run on a GCE instance.


function setup() {
  curl -L https://storage.googleapis.com/istio-release/releases/1.0.0/deb/istio-sidecar.deb > istio-sidecar.deb
  dpkg -i istio-sidecar.deb
}