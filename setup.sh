#!/bin/bash

apt update
apt install -y python3
apt install -y python3-pip
apt install -y python-is-python3
apt install -y ca-certificates
apt install -y build-essential
apt install -y git 

# Install Chrome headerless dependencies
apt install -y libglib2.0-0 libnss3 libnspr4 libatk1.0-0 libatk-bridge2.0-0 libcups2 libdrm2 libgbm1 libgtk-3-0 libpango-1.0-0 libx11-xcb1 libxcomposite1 libxdamage1 libxfixes3 libxrandr2 libasound2 libxshmfence1 libdbus-1-3

wget https://go.dev/dl/go1.21.6.linux-amd64.tar.gz && tar -C /usr/local -xzf go1.21.6.linux-amd64.tar.gz && rm go1.21.6.linux-amd64.tar.gz

export GOROOT=/usr/local/go
export GOPATH=/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
export GO111MODULE=on
export CGO_ENABLED=1

mkdir -p /go/src
mkdir -p /go/bin

cd /tmp && git clone --depth 1 https://github.com/projectdiscovery/httpx.git
cd /tmp/httpx && go mod download
cd /tmp/httpx && go install ./cmd/httpx

/go/bin/httpx -u https://www.example.com -ss -o /tmp/tmp.png
