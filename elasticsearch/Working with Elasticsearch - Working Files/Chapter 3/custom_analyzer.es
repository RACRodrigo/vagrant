DELETE videosearch
{}

PUT videosearch
{
  "settings": {
    "analysis": {
      "analyzer": {
        "title_analyzer": {
	  "char_filter": [
	    "correct_and"
	  ],
	  "tokenizer": "whitespace",
	  "filter": [
	    "lowercase",
	    "asciifolding"
	  ]
	}
      },
      "char_filter": {
	"correct_and": {
	  "type": "mapping",
	  "mappings": [
	    "&=>and"
	  ]
	}
      }
    }
  }
}

GET videosearch/_analyze?pretty
{
  "analyzer": "title_analyzer",
  "text": "#bbuzz 2015: Radu Gheorghe & Rafał Kuć – Side by Side with Elasticsearch & Solr part 2"
}
     
	
