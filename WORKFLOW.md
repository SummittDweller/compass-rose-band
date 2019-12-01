

This is the docker-bootstrap config file for https://thecompassroseband.net. My docker-bootstrap Workflow post describes the server setup too.

Run the following ONE time on the host...

NAME=compassrose
HOST=compassroseband.net,thecompassroseband.net,thecompassroseband.com
IMAGE="summittdweller/compassrose"
docker container run -d --name ${NAME} \
    --label traefik.backend=${NAME} \
    --label traefik.docker.network=opt_webgateway \
    --label "traefik.frontend.rule=Host:${HOST}" \
    --label traefik.port=80 \
    --label com.centurylinklabs.watchtower.enable=true \
    --network opt_webgateway \
    --restart always \
    ${IMAGE}
