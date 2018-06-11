PUT _template/logs
{
  "template" : "logs_*",
  "settings" : {
    "refresh_interval" : "5s"
  },
  "mappings" : {
    "syslog" : {
      "_all" : {
	"enabled" : false
      }
    }
  }
}

PUT logs_2016-01-02
{}

GET logs_2016-01-02?pretty
{}
