This is the docker-bootstrap config file for https://compassroseband.net. My docker-bootstrap Workflow post describes the server setup too.

Note that `baseURL=compassroseband.net` in the project's `config.toml` file.

Run the following ONE time on the host...

NAME=compassrose
HOST="compassroseband.net|thecompassroseband.net|thecompassroseband.com"
IMAGE="summittdweller/compassrose"
docker container run -d --name ${NAME} \
    --label traefik.backend=${NAME} \
    --label traefik.docker.network=web \
    --label traefik.port=80 \
    --label "traefik.frontend.redirect.regex=^http(s)?://(www.)?(${HOST})(.+)" \
    --label "traefik.frontend.redirect.replacement=https://compassroseband.net$4" \
    --label "traefik.frontend.redirect.permanent=true" \
    --label com.centurylinklabs.watchtower.enable=true \
    --network web \
    --restart always \
    ${IMAGE}

See https://github.com/containous/traefik/issues/2796

Below NOT working with multiple domains...
  HOST="compassroseband.net"
    --label "traefik.frontend.rule=Host:${HOST}" \

Replaced above with this for multiple domains...
  HOST="compassroseband.net|thecompassroseband.net|thecompassroseband.com"
  --label "traefik.frontend.redirect.regex=^http(s)?://(www.)?(${HOST})(.+)" \
  --label "traefik.frontend.redirect.replacement=https://compassroseband.net$4" \
  --label "traefik.frontend.redirect.permanent=true" \

Since multiple domains do not working in the above configurations, I'm going to try creating three identical images, each with it's own unique address.  Then I will use the three-pronged script below to engage the images, and also add a new `store.compassroseband.net` address to the server while I am at it.

NAME=compassrose1
HOST="compassroseband.net"
IMAGE="summittdweller/compassrose1"
docker container run -d --name ${NAME} \
    --label traefik.backend=${NAME} \
    --label traefik.docker.network=web \
    --label traefik.port=80 \
    --label "traefik.frontend.rule=Host:${HOST}" \
    --label com.centurylinklabs.watchtower.enable=true \
    --network web \
    --restart always \
    ${IMAGE}

NAME=compassrose2
HOST="thecompassroseband.net"
IMAGE="summittdweller/compassrose2"
docker container run -d --name ${NAME} \
    --label traefik.backend=${NAME} \
    --label traefik.docker.network=web \
    --label traefik.port=80 \
    --label "traefik.frontend.rule=Host:${HOST}" \
    --label com.centurylinklabs.watchtower.enable=true \
    --network web \
    --restart always \
    ${IMAGE}

NAME=compassrose3
HOST="thecompassroseband.com"
IMAGE="summittdweller/compassrose3"
docker container run -d --name ${NAME} \
    --label traefik.backend=${NAME} \
    --label traefik.docker.network=web \
    --label traefik.port=80 \
    --label "traefik.frontend.rule=Host:${HOST}" \
    --label com.centurylinklabs.watchtower.enable=true \
    --network web \
    --restart always \
    ${IMAGE}

NAME=compass-rose-store
HOST="store.compassroseband.net"
IMAGE="summittdweller/compass-rose-store"
docker container run -d --name ${NAME} \
    --label traefik.backend=${NAME} \
    --label traefik.docker.network=web \
    --label traefik.port=80 \
    --label "traefik.frontend.rule=Host:${HOST}" \
    --label com.centurylinklabs.watchtower.enable=true \
    --network web \
    --restart always \
    ${IMAGE}
