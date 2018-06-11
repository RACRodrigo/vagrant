# register repository
PUT _snapshot/fs_backup
{
  "type": "fs",
  "settings": {
    "location": "/opt/backups",
    "max_snapshot_bytes_per_sec": "40mb",
    "max_restore_bytes_per_sec": "40mb"
  }
}

# (incremental) backup
PUT /_snapshot/fs_backup/first
{
  "indices": "videosearch,logs_*",
  "ignore_unavailable": true
}

# status
GET _snapshot/fs_backup/first?pretty
{}

# restore (to a different index)
POST /_snapshot/fs_backup/first/_restore
{
  "indices": "videosearch",
  "rename_pattern": "(.+)",
  "rename_replacement": "$1_restore"
}

GET _cat/indices?h=index&v
{}

# always delete via API, never files
DELETE _snapshot/fs_backup/first
{}
