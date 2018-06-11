# delete current index
DELETE videosearch
{}

# put a new one with a nested mapping
PUT videosearch
{
  "mappings": {
    "videos": {
      "properties": {
	"comments": {
	  "type": "nested"
	}
      }
    }
  }
}

# put the same document again
PUT videosearch/videos/1?pretty
{
  "id": "1",
  "url": "https://www.youtube.com/watch?v=I06NWbtj4nQ",
  "title": "Search Analytics: Business Value & BigData NoSQL Backend, Otis Gospodnetic",
  "uploaded_by": "LuceneSolrRevolution",
  "upload_date": "2014-10-24",
  "views": 70,
  "tags": ["business value", "big data", "search analytics"],
  "comments": [
    {
      "text": "very interesting, thanks!",
      "user": "bigdata_lover",
      "date": "2014-11-02T22:22:00Z"
    },
    {
      "text": "nice to meet you, Otis",
      "user": "user2",
      "date": "2014-12-01T08:35:37Z"
    }
  ]
}

# the same if you get
GET videosearch/videos/1?pretty
{}
