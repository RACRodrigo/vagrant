POST users/_search?pretty
{
  "query": {
    "match": {
      "name": "doe"
    }
  }
}

POST videos/_search?pretty
{
  "query": {
    "terms": {
      "comments.user": ["bigdata_lover", "user2"]
    }
  }
}
