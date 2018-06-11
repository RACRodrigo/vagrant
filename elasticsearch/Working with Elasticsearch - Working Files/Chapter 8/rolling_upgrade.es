GET _cat/nodes?v&h=name
{}

# stop indexing
# synced flush gets invalidated on shards that change
POST _flush/synced?pretty
{}

PUT _cluster/settings?pretty
{
  "transient": {
    "cluster.routing.allocation.enable": "none"
  }
}

# stop and upgrade

# re-enable allocation
PUT _cluster/settings?pretty
{
  "transient": {
    "cluster.routing.allocation.enable": "all"
  }
}

# wait for green
GET _cat/health?v&h=status,node.data,shards,pri,relo,init,unassign
{}
