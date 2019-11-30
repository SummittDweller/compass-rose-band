#!/bin/bash
cd ~/Documents/GitHub/compass-rose-band
current=`git symbolic-ref --short -q HEAD`
git checkout ${current}
# compile the site before copying to the new image
hugo
# perl -i.bak -lpe  'BEGIN { sub inc { my ($num) = @_; ++$num } } s/(build = )(\d+)/$1 . (inc($2))/eg' config.toml
docker image build --no-cache -t compassrose .
docker login
docker tag compassrose summittdweller/compassrose:latest
docker push summittdweller/compassrose:latest
