HISTORICAL_CHECK_PORT=${HISTORICAL_PORT:-8083}
nc -z 127.0.0.1 $HISTORICAL_CHECK_PORT
OK=$?
if [ $OK == 0 ]; then
        exit 0
else
        exit 1
fi
