DELETE videosearch
{}

PUT videosearch
{
  "settings": {
    "analysis": {
      "analyzer": {
        "title_analyzer": {
	  "tokenizer": "standard",
	  "filter": ["letter_gram"]
	}
      },
      "filter": {
	"letter_gram": {
	  "type": "ngram",
	  "min_gram": 3,
	  "max_gram": 4
	}
      }
    }
  }
}

GET videosearch/_analyze?pretty
{
  "analyzer": "title_analyzer",
  "text": "elasticsearch"
}

DELETE videosearch
{}

PUT videosearch
{
  "settings": {
    "analysis": {
      "analyzer": {
        "title_analyzer": {
	  "tokenizer": "standard",
	  "filter": ["word_gram"]
	}
      },
      "filter": {
	"word_gram": {
	  "type": "shingle",
	  "min_shingle_size": 3,
	  "max_shingle_size": 4
	}
      }
    }
  }
}

GET videosearch/_analyze?pretty
{
  "analyzer": "title_analyzer",
  "text": "side by side with elasticsearch and solr"
}

DELETE videosearch
{}

PUT videosearch
{
  "settings": {
    "analysis": {
      "analyzer": {
        "title_analyzer": {
	  "tokenizer": "standard",
	  "filter": ["video_synonyms"]
	}
      },
      "filter": {
	"video_synonyms": {
	  "type": "synonym",
	  "synonyms": [
	    "elastic search, elasticsearch"
	  ]
	}
      }
    }
  },
  "mappings": {
    "videos": {
      "properties": {
	"title": {
	  "type": "string",
	  "analyzer": "standard"
	}
      }
    }
  }
}

PUT videosearch/videos/1?pretty
{
  "title": "introduction to elasticsearch"
}

POST videosearch/_search?pretty
{
  "query": {
    "match": {
      "title": {
	"query": "elastic search",
	"analyzer": "title_analyzer"
      }
    }
  }
}
