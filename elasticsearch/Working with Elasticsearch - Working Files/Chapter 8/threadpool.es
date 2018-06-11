PUT _cluster/settings?pretty
{
  "transient": {
    "threadpool": {
      "bulk.queue_size": 50
    }
  }
}
