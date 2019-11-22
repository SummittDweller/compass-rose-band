# Use a stock Docksal image as the base
FROM docksal/cli:2.6-php7.3

env HUGO_VERSION=0.59.1

# Install Hugo
RUN wget -q https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.deb -O /tmp/hugo.deb \
    && dpkg -i /tmp/hugo.deb
