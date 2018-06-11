# stop indexing
# synced flush gets invalidated on shards that change
POST /_flush/synced?pretty
{}

PUT _cluster/settings?pretty
{
  "transient": {
    "cluster.routing.allocation.enable": "none"
  }
}

# stop ALL and upgrade

# wait for yellow
GET _cat/health?v&h=status,node.data,shards,pri,relo,init,unassign
{}

# re-enable allocation
PUT _cluster/settings?pretty
{
  "transient": {
    "cluster.routing.allocation.enable": "all"
  }
}

# good to go on green
GET _cat/health?v&h=status,node.data,shards,pri,relo,init,unassign
{}
