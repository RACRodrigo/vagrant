PUT products/_mapping/products
{
  "products": {
    "properties": {
      "shipped_at": {
	"type": "date"
      },
      "expires_at": {
	"type": "date",
	"format": "MM/dd/YYYY"
      }
    }
  }
}

PUT products/products/1?pretty
{
  "shipped_at": "2015-12-02T12:00:52.123-05:00",
  "expires_at": "11/25/2016"
}

POST products/_search?pretty
{
  "query": {
    "match": {
      "expires_at": "11/25/2016"
    }
  }
}
