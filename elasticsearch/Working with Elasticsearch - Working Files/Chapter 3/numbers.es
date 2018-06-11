DELETE products
{}

PUT products
{
  "mappings": {
    "products": {
      "properties": {
	"price": {
	  "type": "float"
	},
	"days_on_shelf": {
	  "type": "integer",
	  "index": "no"
	}
      }
    }
  }
}

PUT products/products/1?pretty
{
  "price": 9.99,
  "days_on_shelf": 2
}

POST products/_search?q=price:9.99&pretty
{}

POST products/_search?q=days_on_shelf:2&pretty
{}
