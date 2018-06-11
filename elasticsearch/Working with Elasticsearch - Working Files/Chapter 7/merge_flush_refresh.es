PUT videosearch/_settings
{
  "index.merge": {
    "policy": {
      "segments_per_tier": 10,
      "max_merge_at_once": 10,
      "max_merged_segment": "5gb"
    },
    "scheduler": {
      "max_thread_count": 1,
      "auto_throttle": true
    }
  }
}

POST videosearch/_optimize?max_num_segments=1
{}

PUT videosearch/_settings
{
  "index.translog": {
    "flush_threshold_size": "512mb",
    "flush_threshold_period": "30m"
  }
}
# elasticsearch.yml
# indices.memory.index_buffer_size

POST videosearch/_flush
{}

PUT videosearch/_settings
{
  "index.refresh_interval": "5s"
}

PUT videosearch/_settings
{
  "index.refresh_interval": -1
}

POST videosearch/_refresh
{}
