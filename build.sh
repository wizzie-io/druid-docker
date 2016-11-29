docker build -t druid-${SERVICE}:${VERSION} .
docker tag druid-${SERVICE}:${VERSION} gcr.io/stream-150408/druid-${SERVICE}:${VERSION}
gcloud docker -- push gcr.io/stream-150408/druid-${SERVICE}:${VERSION}
