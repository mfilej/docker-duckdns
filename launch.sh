#!/bin/sh
DUCKDNS_UPDATE_INTERVAL=${DUCKDNS_UPDATE_INTERVAL:-1800}

if [ -z "$DUCKDNS_DOMAIN" ]; then
	echo 'Please supply the $DUCKDNS_DOMAIN environment variable'
	exit 1
fi

if [ -z "$DUCKDNS_TOKEN" ]; then
	echo 'Please supply the $DUCKDNS_TOKEN environment variable'
	exit 1
fi

while true; do
	URL="https://www.duckdns.org/update?domains=${DUCKDNS_DOMAIN}&token=${DUCKDNS_TOKEN}"
	echo "Calling URL: $URL"
	RESPONSE=$(curl -s -k "$URL" & wait)
	echo "Duck DNS response: ${RESPONSE}"

	# Sleep and loop
	sleep $DUCKDNS_UPDATE_INTERVAL & wait
done
