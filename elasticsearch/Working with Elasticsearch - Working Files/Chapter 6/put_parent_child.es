DELETE videosearch
{}

# put the mapping
PUT videosearch
{
  "mappings": {
    "comments": {
      "_parent": {
        "type": "videos"
      }
    }
  }
}

# index the video
PUT videosearch/videos/1?pretty
{
  "id": "1",
  "url": "https://www.youtube.com/watch?v=I06NWbtj4nQ",
  "title": "Search Analytics: Business Value & BigData NoSQL Backend, Otis Gospodnetic",
  "uploaded_by": "LuceneSolrRevolution",
  "upload_date": "2014-10-24",
  "views": 70,
  "tags": ["business value", "big data", "search analytics"]
}

# index comments
PUT videosearch/comments/1?parent=1&pretty
{
  "text": "very interesting, thanks!",
  "user": "bigdata_lover",
  "date": "2014-11-02T22:22:00Z"
}
PUT videosearch/comments/2?parent=1&pretty
{
  "text": "nice to meet you, Otis",
  "user": "user2",
  "date": "2014-12-01T08:35:37Z"
}
