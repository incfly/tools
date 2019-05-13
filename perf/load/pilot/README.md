# Pilot Load Test

## Basic Setup

This folder includes a chart for light weight pilot performance measurements. Each workload only has
one Envoy sidecar, single container in a Pod.

In 1.1.2 release, as resource consumption data point,
Envoy sidecar consumes 5m CPU and 128M memory.

## Config Push Latency Test

Config push measures the latency of the CDS push, the time starting from service discovery
changes to the corresponding CDS changes reflected in the Envoy config.

Several special installation setup is needed.

- Remove Prometheus metrics drop in the config map
- Update Prometheus scrape interval from 15s to x seconds
- Ensure the cluster is appropriated provisioned with enough memory


`./load_test.py`, starts large deployment, measure how long it takes for all
sidecar to receive the same cds version.

TODO

- Fix Pilot/Prometheus/Control Plane scalability problems, resource requirements.
- Ensure prometheus scrape interval is set correctly.
- `envoy_cluster_manager_cds_version` does not work well when sidecar resource is used.
- Add annotation for emiting the specific clusters, "sidecar.istio.io/statsInclusionPrefixes": "TBD"
- Using new proxy image: gcr.io/mixologist-142215/proxyv2:suffix4
- Removing Promethues load report drop config
  - `regex: '(outbound|inbound|prometheus_stats).*'`
  - `regex: 'envoy_cluster_(lb|retry|bind|internal|max|original).*'`
- Change to `envoy_cluster_manager_cds_version{namespace="pilot-load"}` focusing on the testing namespace.
- Add query `sum(envoy_cluster_upstream_cx_total{cluster_name=~".*pilot-load.*"})  by (cluster_name)`.
