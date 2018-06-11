DELETE _all
{}

PUT rafal
{}

PUT users
{}

PUT users/emails/1?routing=jane
{
  "user": "jane",
  "text": "good day, world!"
}

PUT users/emails/2?routing=joe
{
  "user": "joe",
  "text": "hello world"
}

POST _aliases
{
  "actions" : [
    {
      "add" : {
        "index" : "users",
        "alias" : "jane",
        "routing" : "jane",
	"filter": {
	  "term": {
	    "user": "jane"
	  }
	}
      }
    }
  ]
}'

POST jane/_search?pretty
{}

PUT videosearch_v1
{}

POST _aliases
{
  "actions" : [
    {
      "add" : {
        "index" : "videosearch_v1",
        "alias" : "videosearch"
      }
    }
  ]
}'

PUT videosearch_v2
{}

POST _aliases
{
  "actions" : [
    {
      "remove" : {
        "index" : "videosearch_v1",
        "alias" : "videosearch"
      }
    },
    {
      "add" : {
        "index" : "videosearch_v2",
        "alias" : "videosearch"
      }
    }
  ]
}'

GET _aliases?pretty
{}
