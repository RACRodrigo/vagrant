# regular aggs fail
POST videosearch/_search?pretty
{
  "size": 0,
  "aggs": {
    "comments_per_month": {
      "date_histogram": {
	"field": "comments.date",
	"interval": "month"
      }
    }
  }
}

# wrap it in a nested aggregation
# regular aggs fail
POST videosearch/_search?pretty
{
  "size": 0,
  "aggs": {
    "go_to_comments": {
      "nested": {
	"path": "comments"
      },
      "aggs": {
	"comments_per_month": {
          "date_histogram": {
       	    "field": "comments.date",
	    "interval": "month"
	  }
	}
      }
    }
  }
}
