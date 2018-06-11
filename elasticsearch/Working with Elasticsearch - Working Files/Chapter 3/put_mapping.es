PUT logs
{
  "mappings": {
    "apache": {
      "properties": {
	"timestamp": {
	  "type": "date"
        },
        "response_code": {
          "type": "integer"
        }
      }
    },
    "syslog": {
      "properties": {
	"timestamp": {
	  "type": "date"
	},
	"message": {
	  "type": "string"
	}
      }
    }
  }
}
     
PUT logs/_mappings/syslog
{
  "syslog": {
    "properties": {
      "severity": {
	"type": "string"
      }
    }
  }
}

GET logs/_mappings/syslog?pretty
{}

GET logs/_mappings?pretty
{}

DELETE logs
{}
