# docker-stunnel-client

A Docker container with STunnel running in client mode. Expose remote TLS ports locally without it.

Commonly used to connect to services that are exposed with TLS from an application that doesn't. Like some clients for Redis, MQTT, etc.

If you're using kubernetes, check the sidecar pattern.

## Usage

Let's say you have a service with TLS running on IP 192.0.2.1, on port 6379. This is how you expose it locally in the port 5000:

```shell
docker run -d -e HOST=192.0.2.1 -e REMOTE_PORT=6379 -e LOCAL_PORT=5000 --network host --name stunnel-client gabrielctpinheiro/stunnel-client
```

Here is the meaning of each parameter:
- `-d`: run in detached mode.
- `-e HOST`: the host to connect to.
- `-e REMOTE_PORT`: the port to connect to.
- `-e LOCAL_PORT`: the port to expose in the container.
- `--network host`: use your computer's network interfaces instead of creating a bridge. This is useful if you want to connect to a service through a VPN. You could use `-p 5000:5000` instead, for most cases.
- `--name stunnel-client`: name of the container.
- `gabrielctpinheiro/stunnel-client`: the image to use.
