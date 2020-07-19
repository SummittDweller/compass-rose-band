#!/bin/bash
# cd /Users/markmcfate/Projects/compass-rose-band
# current=`git symbolic-ref --short -q HEAD`
# git checkout ${current}

## Login to docker, one time only!
cat ~/my_password.txt | /usr/local/bin/docker login -u summittdweller --password-stdin

# Compile the site before copying to the new image.  Round 1 = compassroseband.net
/usr/local/bin/hugo --ignoreCache --ignoreVendor --minify --debug --verbose --baseURL=https://compassroseband.net
echo "Hugo's compassroseband.net compilation is complete."
echo "Starting docker image build..."
/usr/local/bin/docker image build -f push-update-Dockerfile --no-cache -t compassrose .
echo "docker image build is complete."
# cat ~/my_password.txt | /usr/local/bin/docker login -u summittdweller --password-stdin
/usr/local/bin/docker tag compassrose summittdweller/compassrose1:latest
/usr/local/bin/docker push summittdweller/compassrose1:latest

# Compile the site before copying to the new image.  Round 2 = thecompassroseband.net
/usr/local/bin/hugo --ignoreCache --ignoreVendor --minify --debug --verbose --baseURL=https://thecompassroseband.net
echo "Hugo's thecompassroseband.net compilation is complete."
echo "Starting docker image build..."
/usr/local/bin/docker image build -f push-update-Dockerfile --no-cache -t compassrose .
echo "docker image build is complete."
# cat /var/root/my_password.txt | sudo /usr/local/bin/docker login -u summittdweller --password-stdin
/usr/local/bin/docker tag compassrose summittdweller/compassrose2:latest
/usr/local/bin/docker push summittdweller/compassrose2:latest

# Compile the site before copying to the new image.  Round 3 = thecompoassroseband.com
/usr/local/bin/hugo --ignoreCache --ignoreVendor --minify --debug --verbose --baseURL=https://thecompassroseband.com
echo "Hugo's thecompassroseband.com compilation is complete."
echo "Starting docker image build..."
/usr/local/bin/docker image build -f push-update-Dockerfile --no-cache -t compassrose .
echo "docker image build is complete."
# cat /var/root/my_password.txt | sudo /usr/local/bin/docker login -u summittdweller --password-stdin
/usr/local/bin/docker tag compassrose summittdweller/compassrose3:latest
/usr/local/bin/docker push summittdweller/compassrose3:latest
