# Docker DuckDNS
This image will periodically update the Dynamic DNS with [duckdns.org](https://www.duckdns.org/)

## Environment Variables
The default parameters can be overridden by setting environment variables on the container using the **docker run -e** flag.

 * **DUCKDNS_DOMAIN** - Subdomain/hostname to update, e.g. myhostname.
 * **DUCKDNS_TOKEN** - DuckDNS authentication token copied from duckdns.org -> install -> linux cron, e.g. 1234abcd-abcd-1234-abcd-123456789abc
 * **DUCKDNS_UPDATE_INTERVAL=600** - Interval in seconds to sleep between updates. Defaults to 1800 seconds = 30 minutes.

### Command Line
```
docker run \
	-e DUCKDNS_DOMAIN=myhostname \
	-e DUCKDNS_TOKEN=1234abcd-abcd-1234-abcd-123456789abc \
    mfilej/duckdns:latest
```
