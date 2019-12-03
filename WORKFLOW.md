This is the docker-bootstrap config file for https://compassroseband.net. My docker-bootstrap Workflow post describes the server setup too.

Note that `baseURL=compassroseband.net` in the project's `config.toml` file.

Run the following ONE time on the host...

NAME=compassrose
HOST="compassroseband.net"
IMAGE="summittdweller/compassrose"
docker container run -d --name ${NAME} \
    --label traefik.backend=${NAME} \
    --label traefik.docker.network=opt_webgateway \
    --label traefik.port=80 \
    --label "traefik.frontend.rule=Host:${HOST}" \
    --label com.centurylinklabs.watchtower.enable=true \
    --network opt_webgateway \
    --restart always \
    ${IMAGE}

See https://github.com/containous/traefik/issues/2796

Below NOT working with multiple domains...
  HOST="compassroseband.net"
    --label "traefik.frontend.rule=Host:${HOST}" \

Replaced above with this for multiple domains...
  HOST="compassroseband.net|thecompassroseband.net|thecompassroseband.com"
  --label "traefik.frontend.redirect.regex=^http(s)?://(www.)?(${HOST})/(.+)" \
  --label "traefik.frontend.redirect.replacement=https://compassroseband.net/$4" \
  --label "traefik.frontend.redirect.permanent=true" \

NAME=compassrose
DOMAINS="compassroseband.net,thecompassroseband.net,thecompassroseband.com"
REGX="compassroseband.net|thecompassroseband.net|thecompassroseband.com"
IMAGE="summittdweller/compassrose"
docker container run -d --name ${NAME} \
    --label traefik.backend=${NAME} \
    --label traefik.docker.network=opt_webgateway \
    --label traefik.port=80 \
    --label "traefik.frontend.rule=Host:${DOMAINS}" \
    --label "traefik.frontend.redirect.regex=^https://(www.)?(${REGX})(.+)" \
    --label "traefik.frontend.redirect.replacement=https://compassroseband.net$${3}" \
    --label "traefik.frontend.redirect.permanent=true" \
    --label com.centurylinklabs.watchtower.enable=true \
    --network opt_webgateway \
    --restart always \
    ${IMAGE}
