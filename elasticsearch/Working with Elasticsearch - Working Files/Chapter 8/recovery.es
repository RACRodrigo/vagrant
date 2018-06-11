PUT _cluster/settings?pretty
{
  "transient": {
    "cluster.routing.allocation": {
      "node_concurrent_recoveries": 2,
      "cluster_concurrent_rebalance": 2
    },
    "indices.recovery.max_bytes_per_sec": "40mb"
  }
}
