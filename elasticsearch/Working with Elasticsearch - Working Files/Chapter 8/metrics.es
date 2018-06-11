GET _cluster/stats?pretty
{}

GET _nodes/stats?pretty
{}

GET _cat/indices?v&h=index,store.size
{}
