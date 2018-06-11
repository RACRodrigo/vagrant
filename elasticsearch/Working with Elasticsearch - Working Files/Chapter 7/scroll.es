# specify the scroll parameter to keep context alive
POST videosearch/_search?pretty&scroll=5m
{
  "query": {
    "match": {
      "title": "elasticsearch"
    }
  },
  "size": 1
}

# get the next page by using the scroll you got
# new timeout should be enough to get a new request
POST _search/scroll?pretty
{
  "scroll": "5m",
  "scroll_id": ""
}

# and the next one with the scroll from the previous request
# until there are no more hits
POST _search/scroll?pretty
{
  "scroll": "5m",
  "scroll_id": ""
}

# cheaper with sorting by doc_id
POST videosearch/_search?pretty&scroll=5m
{
  "sort": [
    "_doc"
  ]
}
