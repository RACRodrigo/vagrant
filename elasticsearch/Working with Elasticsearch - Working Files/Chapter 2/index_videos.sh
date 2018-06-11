VIDEO_LOCATION=sample_documents

cd $VIDEO_LOCATION

for FILE in *.json; do
  ID=`echo $FILE | sed s/\.json$//`
  curl -XPUT localhost:9200/videosearch/videos/$ID -d "`cat $FILE`"
done
