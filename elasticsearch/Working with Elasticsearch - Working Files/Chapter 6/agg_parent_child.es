# can do aggregations on comments separately
POST videosearch/comments/_search?pretty
{
  "size": 0,
  "aggs": {
    "comments_per_month": {
      "date_histogram": {
	"field": "date",
	"interval": "month"
      }
    }
  }
}

# index a second video and its comments
PUT videosearch/videos/2?pretty
{
  "id": "2",
  "url": "https://www.youtube.com/watch?v=6QX5hXf_e7c",
  "title": "Introduction to Elasticsearch by Radu",
  "uploaded_by": "HakkaLabs",
  "upload_date": "2013-11-22",
  "views": 850,
  "tags": ["elasticsearch", "introduction", "demo"]
}
PUT videosearch/comments/1?parent=2&pretty
{
  "text": "good ES intro!",
  "user": "bigdata_lover",
  "date": "2014-11-02T22:22:00Z"
}
PUT videosearch/comments/2?parent=2&pretty
{
  "text": "looking forward for an update",
  "user": "user2",
  "date": "2014-11-03T08:35:37Z"
}

# use the children aggregation to do aggs
# on comments based on video buckets
POST videosearch/videos/_search?pretty
{
  "size": 0,
  "aggs": {
    "top_tags": {
      "terms": {
	"field": "uploaded_by"
      },
      "aggs": {
	"to_comments": {
	  "children": {
	    "type": "comments"
	  },
	  "aggs": {
	    "comments_per_month": {
	      "date_histogram": {
		"field": "date",
		"interval": "month"
	      }
	    }
	  }
	}
      }
    }
  }
}
