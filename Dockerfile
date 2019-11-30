## 0 - Build a git-capable image and pull project from the workstation
#
FROM alpine/git
COPY . /data
WORKDIR /data
#
## Themes are now submodules, so just update as such
RUN git submodule update --init --recursive
#
## 1 - Build a Hugo server and compile the static site into /data/public
#
FROM klakegg/hugo:0.59.1-alpine
COPY --from=0 /data /data
WORKDIR /data
RUN hugo --ignoreCache --ignoreVendor --minify --debug --verbose
#
## 2 - Build a simple NGINX serving compiled ./public as /usr/share/nginx/html
#
FROM nginx:alpine
COPY --from=1 /data/public /usr/share/nginx/html
LABEL maintainer Mark A. McFate <mark.mcfate@icloud.com>
