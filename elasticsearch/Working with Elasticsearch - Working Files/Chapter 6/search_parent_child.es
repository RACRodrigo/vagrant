# search everything
POST videosearch/_search?pretty
{}

# search just comments
POST videosearch/comments/_search?pretty
{}

# search videos with properties in comments
# plus the matching comments via inner_hits
POST videosearch/videos/_search?pretty
{
  "query": {
    "has_child": {
      "type": "comments",
      "score_mode": "max",
      "query": {
	"match": {
	  "text": "interesting"
	}
      },
      "inner_hits": {}
    }
  }
}

# show all comments of matching videos
POST videosearch/videos/_search?pretty
{
  "query": {
    "has_child": {
      "type": "comments",
      "score_mode": "max",
      "query": {
	"match": {
	  "text": "interesting"
	}
      }
    }
  },
  "inner_hits": {
    "matching_comments":{
      "type": {
	"comments": {}
      }
    }
  }
}

# of course boundaries between comments work
POST videosearch/videos/_search?pretty
{
  "query": {
    "has_child": {
      "type": "comments",
      "score_mode": "max",
      "query": {
	"bool": {
	  "must": {
	    "match": {
	      "text": "interesting"
	    }
	  },
	  "filter": {
	    "range": {
	      "date": {
		"gt": "2014-12-01"
	      }
	    }
	  }
	}
      },
      "inner_hits": {}
    }
  }
}

# search comments with video properties
POST videosearch/comments/_search?pretty
{
  "query": {
    "has_parent": {
      "type": "videos",
      "query": {
	"match": {
	  "title": "bigdata"
	}
      },
      "inner_hits": {}
    }
  }
}

