POST videosearch/_search?pretty
{
  "query": {
    "match": {
      "comments.user.name": "Jane Doe"
    }
  }
}
