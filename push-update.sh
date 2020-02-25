#!/bin/bash
# cd ~/Projects/GitHub/compass-rose-band
current=`git symbolic-ref --short -q HEAD`
git checkout ${current}

# Compile the site before copying to the new image.  Round 1 = compassroseband.net
hugo --ignoreCache --ignoreVendor --minify --debug --verbose --baseURL=https://compassroseband.net
echo "Hugo's compassroseband.net compilation is complete."
echo "Starting docker image build..."
docker image build -f push-update-Dockerfile --no-cache -t compassrose .
echo "docker image build is complete."
docker login
docker tag compassrose summittdweller/compassrose1:latest
docker push summittdweller/compassrose1:latest

# Compile the site before copying to the new image.  Round 2 = thecompassroseband.net
hugo --ignoreCache --ignoreVendor --minify --debug --verbose --baseURL=https://thecompassroseband.net
echo "Hugo's thecompassroseband.net compilation is complete."
echo "Starting docker image build..."
docker image build -f push-update-Dockerfile --no-cache -t compassrose .
echo "docker image build is complete."
docker login
docker tag compassrose summittdweller/compassrose2:latest
docker push summittdweller/compassrose2:latest

# Compile the site before copying to the new image.  Round 3 = thecompoassroseband.com
hugo --ignoreCache --ignoreVendor --minify --debug --verbose --baseURL=https://thecompassroseband.com
echo "Hugo's thecompassroseband.com compilation is complete."
echo "Starting docker image build..."
docker image build -f push-update-Dockerfile --no-cache -t compassrose .
echo "docker image build is complete."
docker login
docker tag compassrose summittdweller/compassrose3:latest
docker push summittdweller/compassrose3:latest
