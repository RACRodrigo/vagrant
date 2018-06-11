# object searches fail now
POST videosearch/_search?pretty
{
  "query": {
    "match": {
      "comments.text": "interesting"
    }
  }
}

# wrap them in a nested query
POST videosearch/_search?pretty
{
  "query": {
    "nested": {
      "path": "comments",
      "score_mode": "max",
      "query": {
        "match": {
          "comments.text": "interesting"
        }
      }
    }
  }
}

# bool query now works as expected
POST videosearch/_search?pretty
{
  "query": {
    "nested": {
      "path": "comments",
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
      },
      "inner_hits": {
	"size": 2
      }
    }
  }
}
