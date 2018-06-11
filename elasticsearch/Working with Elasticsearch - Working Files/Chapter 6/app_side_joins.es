PUT videos/videos/1?pretty
{
  "url": "https://www.youtube.com/watch?v=I06NWbtj4nQ",
  "title": "Search Analytics: Business Value & BigData NoSQL Backend, Otis Gospodnetic",
  "comments": [
    {
      "text": "very interesting, thanks!",
      "user": "bigdata_lover"
    },
    {
      "text": "nice to meet you, Otis",
      "user": "user2"
    }
  ]
}

PUT videos/videos/2?pretty
{
  "url": "https://www.youtube.com/watch?v=6QX5hXf_e7c",
  "title": "Introduction to Elasticsearch by Radu",
  "uploaded_by": "HakkaLabs",
  "comments": [
    {
      "text": "good ES intro!",
      "user": "user2"
    },
    {
      "text": "looking forward for an update",
      "user": "user3"
    }
  ]
}

PUT users/users/bigdata_lover?pretty
{ "name": "Jane Doe" }

PUT users/users/user2?pretty
{ "name": "John Doe" }

PUT users/users/user3?pretty
{ "name": "Jane Smith" }
