GET _analyze?pretty
{
  "analyzer": "standard",
  "text": "Introduction to Elasticsearch"
}

GET _analyze?pretty
{
  "analyzer": "english",
  "text": "Introduction to Elasticsearch"
}

DELETE videosearch
{}

PUT videosearch
{
  "mappings": {
    "videos": {
      "properties": {
        "title": {
	  "type": "string",
	  "analyzer": "english"
	}
      }
    }
  }
}

PUT videosearch/videos/1?pretty
{
  "title": "Introduction to Elasticsearch"
}

POST videosearch/_search?pretty
{
  "query": {
    "match": {
      "title": {
	"query": "Elasticsearch introductions",
	"operator": "AND"
      }
    }
  }
}
