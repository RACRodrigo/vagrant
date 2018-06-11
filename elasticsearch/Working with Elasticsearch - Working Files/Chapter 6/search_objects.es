# works well when you search in one field
POST videosearch/_search?pretty
{
  "query": {
    "match": {
      "comments.text": "interesting"
    }
  }
}

# not so well when searching in multiple fields
POST videosearch/_search?pretty
{
  "query": {
    "bool": {
      "must": {
        "match": {
	  "comments.text": "interesting"
	}
      },
      "filter": {
	"range": {
	  "comments.date": {
	    "gte": "2014-12-01"
	  }
	}
      }
    }
  }
}

# because of how objects are stored
GET videosearch/videos/1?pretty&_source=true&fields=comments.text,comments.date
{}
