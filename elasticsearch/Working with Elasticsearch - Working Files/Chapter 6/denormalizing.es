DELETE videosearch
{}

PUT videosearch/videos/1?pretty
{
  "url": "https://www.youtube.com/watch?v=I06NWbtj4nQ",
  "title": "Search Analytics: Business Value & BigData NoSQL Backend, Otis Gospodnetic",
  "comments": [
    {
      "text": "very interesting, thanks!",
      "user": {
	"id": "bigdata_lover",
	"name": "Jane Doe"
      }
    },
    {
      "text": "nice to meet you, Otis",
      "user": {
	"id": "user2",
	"name": "John Doe"
      }
    }
  ]
}

PUT videosearch/videos/2?pretty
{
  "url": "https://www.youtube.com/watch?v=6QX5hXf_e7c",
  "title": "Introduction to Elasticsearch by Radu",
  "uploaded_by": "HakkaLabs",
  "comments": [
    {
      "text": "good ES intro!",
      "user": {
	"id": "user2",
	"name": "John Doe"
      }
    },
    {
      "text": "looking forward for an update",
      "user": {
	"id": "user3",
	"name": "Jane Smith"
      }
    }
  ]
}
