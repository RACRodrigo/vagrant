DELETE _all
{}

PUT videosearch
{
  "number_of_shards": 3
}

GET _cat/shards?v&h=index,prirep,node
{}

PUT _cluster/settings?pretty
{
  "transient": {
    "cluster.routing.allocation.awareness.attributes": "rack"
  }
}

GET _cat/shards?v&h=index,prirep,node
{}

PUT _cluster/settings?pretty
{
  "transient": {
    "cluster.routing.allocation.disk": {
      "threshold_enabled": true
      "watermark.high": "90%",
      "watermark.low": "85%"
    }
  }
}
