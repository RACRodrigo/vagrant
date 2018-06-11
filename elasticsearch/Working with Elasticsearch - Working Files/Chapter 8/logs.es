PUT _cluster/settings?pretty
{
  "transient": {
    "logger.discovery": "TRACE"
  }
}

PUT videosearch/_settings?pretty
{
  "index.search.slowlog.threshold": {
    "query.warn": "1s",
    "query.info": "500ms",
    "fetch.trace": "0ms"
  }
}
