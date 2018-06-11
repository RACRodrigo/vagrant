PUT products/_mapping/products
{
  "products": {
    "properties": {
      "in_stock": {
	"type": "boolean"
      }
    }
  }
}

PUT products/products/2?pretty
{
  "name": "old product",
  "in_stock": false
}

POST products/_search?q=in_stock:false&pretty
{}

DELETE products
{}

PUT products
{
  "mappings": {
    "products": {
      "properties": {
	"tags": {
	  "type": "string",
	  "fields": {
	    "verbatim": {
	      "type": "string",
	      "index": "not_analyzed"
	    }
	  }
	}
      }
    }
  }
}

PUT products/products/1?pretty
{
  "tags": "hair dryer"
}

POST products/_search?pretty
{
  "query": {
    "match": {
      "tags": "hair"
    }
  },
  "aggs": {
    "top_tags": {
      "terms": {
	"field": "tags.verbatim"
      }
    }
  }
}
