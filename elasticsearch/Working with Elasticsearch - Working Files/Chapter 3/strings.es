PUT products/_mapping/products
{
  "products": {
    "properties": {
      "tags": {
	"type": "string",
	"index": "not_analyzed",
	"index_options": "docs"
      },
      "short_description": {
	"type": "string",
	"index_options": "freqs",
	"copy_to": "description"
      },
      "name": {
	"type": "string",
	"index_options": "positions",
	"norms": {
	  "enabled": false
	}
      },
      "description": {
	"type": "string",
	"index_options": "offsets"
      }
    }
  }
}

PUT products/products/1?pretty
{
  "tags": ["hair dryer", "powerful"],
  "short_description": "best hair dryer ever",
  "name": "a hair dryer",
  "description": "you've got to buy this thing. It sucks. Humidity out of your hair, that is"
}

POST products/_search?pretty
{
  "query": {
    "match": {
      "tags": "hair"
    }
  }
}

POST products/_search?pretty
{
  "query": {
    "match": {
      "tags": "hair dryer"
    }
  },
  "aggs": {
    "top_tags": {
      "terms": {
	"field": "tags"
      }
    },
    "name_word_cloud": {
      "terms": {
	"field": "name"
      }
    }
  }
}

POST products/_search?pretty
{
  "query": {
    "match_phrase": {
      "name": "a hair"
    }
  }
}

POST products/_search?pretty
{
  "query": {
    "match": {
      "description": "best hair dryer sucks"
    }
  }
}
