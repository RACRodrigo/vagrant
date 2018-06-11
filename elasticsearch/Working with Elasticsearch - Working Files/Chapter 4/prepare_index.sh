curl -XDELETE localhost:9200/videosearch
curl -XPUT localhost:9200/videosearch -d '{
  "mappings": {
    "videos": {
      "properties": {
        "id": {
          "type": "string"
        },
        "likes": {
          "type": "long"
        },
        "tags": {
          "type": "string",
          "analyzer": "english",
          "fields": {
            "verbatim": {
              "type": "string",
              "index": "not_analyzed"
            }
          }
        },
        "title": {
          "type": "string",
          "analyzer": "lowercase_asciifolding",
          "fields": {
            "stemmed": {
              "type": "string",
              "analyzer": "english"
            }
          }
        },
        "upload_date": {
          "type": "date",
          "format": "dateOptionalTime"
        },
        "uploaded_by": {
          "type": "string",
          "fields": {
            "verbatim": {
              "type": "string",
              "index": "not_analyzed"
            }
          }
        },
        "url": {
          "type": "string",
          "analyzer": "letters_only"
        },
        "views": {
          "type": "long"
        }
      }
    }
  },
  "settings": {
    "number_of_shards": 1,
    "analysis": {
      "analyzer": {
        "lowercase_asciifolding": {
          "type": "custom",
          "tokenizer": "standard",
          "filter": [
            "lowercase",
            "asciifolding"
          ]
        },
        "letters_only": {
          "type": "custom",
          "tokenizer": "letter",
          "filter": [
            "lowercase"
          ]
        }
      }
    }
  }
}'
