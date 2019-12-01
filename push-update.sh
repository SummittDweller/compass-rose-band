#!/bin/bash
# cd ~/Projects/GitHub/compass-rose-band
current=`git symbolic-ref --short -q HEAD`
git checkout ${current}
# compile the site before copying to the new image
hugo --ignoreCache --ignoreVendor --minify --debug --verbose
echo "Hugo compilation is complete."
# perl -i.bak -lpe  'BEGIN { sub inc { my ($num) = @_; ++$num } } s/(build = )(\d+)/$1 . (inc($2))/eg' config.toml
echo "Starting docker image build..."
docker image build -f push-update-Dockerfile --no-cache -t compassrose .
echo "docker image build is complete."
docker login
docker tag compassrose summittdweller/compassrose:latest
docker push summittdweller/compassrose:latest
