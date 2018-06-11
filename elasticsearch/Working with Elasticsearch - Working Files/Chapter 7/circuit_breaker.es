PUT _cluster/settings?pretty
{
  "persistent": {
    "indices.breaker": {
      "fielddata.limit": "20%",
      "request.limit": "10%",
      "total.limit": "25%"
    }
  }
}

POST _search?request_cache=true&pretty
{
  "size": 0,
  "query": {
    "match": {
      "title": "elasticsearch"
    }
  },
  "aggs": {
    "title_word_cloud": {
      "terms": {
        "field": "title"
      }
    }
  }
}
