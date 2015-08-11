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
	MACHINE_IP=$(ip route get 8.8.8.8 | awk '/8.8.8.8/ {print $NF}')
	IP=${DUCKDNS_IP:-$MACHINE_IP}
	echo "Using IP: $IP"

	URL="https://www.duckdns.org/update?domains=${DUCKDNS_DOMAIN}&token=${DUCKDNS_TOKEN}&ip=${IP}"
	echo "Calling URL: $URL"
	curl -s -k "$URL" & wait

	# Sleep and loop
	sleep $DUCKDNS_UPDATE_INTERVAL & wait
done
