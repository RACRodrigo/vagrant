PUT products
{
  "mappings": {
    "products": {
      "_source": {
	"enabled": false
      },
      "properties": {
	"name": {
	  "type": "string",
	  "store": true
	}
      }
    }
  }
}

PUT products/products/1?pretty
{ "name": "test product" }

POST products/_search?pretty
{}

POST products/_search?pretty
{
  "fields": [ "name" ]
}

POST products/_search?q=product&pretty
{}

DELETE products
{}

PUT products
{
  "mappings": {
    "products": {
      "_all": {
	"enabled": true
      },
      "properties": {
	"name": {
	  "type": "string",
	  "include_in_all": false
	},
	"brand": {
	  "type": "string"
	}
      }
    }
  }
}

PUT products/products/1?pretty
{
  "name": "test product",
  "brand": "test company"
}

POST products/_search?q=product&pretty
{}

POST products/_search?q=company&pretty
{}

POST products/_search?q=company&pretty
{
  "aggs": {
    "show_uids": {
      "terms": {
	"field": "_uid"
      }
    }
  }
}

DELETE products
{}
