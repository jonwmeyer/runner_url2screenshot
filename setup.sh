#!/bin/bash

apt update
apt install -y python3ls -l
apt install -y python3-pip
apt install -y python-is-python3
apt install -y ca-certificates
apt install -y build-essential
apt install -y git 
apt install -y curl

export GOROOT=/usr/local/go
export GOPATH=/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
export GO111MODULE=on
export CGO_ENABLED=1
export SCRAPFLY_API_KEY="scp-live-e18aaf826f8b42ab9fda7d17f0f3fd6c"
export URL="https://example.com"

mkdir -p /go/src
mkdir -p /go/bin
mkdir -p /screenshots

wget https://go.dev/dl/go1.24.4.linux-amd64.tar.gz && tar -C /usr/local -xzf go1.24.4.linux-amd64.tar.gz && rm go1.24.4.linux-amd64.tar.gz

curl -G \
--request "GET" \
--url $URL \
--data-urlencode "key=$SCRAPFLY_API_KEY" \
--data-urlencode "url=https://web-scraping.dev/product/1" -o /screenshots/screenshot.jpg


#echo "https://api.scrapfly.io/screenshot?url=https://example.com&key=$SCRAPFLY_API_KEY"
