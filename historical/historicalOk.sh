<<<<<<< HEAD
HISTORICAL_CHECK_PORT=${HISTORICAL_PORT:-8083}
=======
STORICAL_CHECK_PORT=${HISTORICAL_PORT:-8083}
>>>>>>> 3180e9b9f5a4eaab90a9cfcfaed6ddef10c5a3df
OK=$(curl -s -o /dev/null -w "%{http_code}" http://127.0.0.1:${HISTORICAL_CHECK_PORT}/status)
if [ "$OK" == "200" ]; then
   exit 0
else
   exit 1
fi
