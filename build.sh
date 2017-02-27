#!/bin/bash

LDFLAGS="-s -w -X main.version=${TRAVIS_TAG:-TRAVIS_COMMIT}"
LDFLAGS+=" -X github.com/dropbox/dbxcli/cmd.personalAppKey=${PERSONAL_KEY}"
LDFLAGS+=" -X github.com/dropbox/dbxcli/cmd.personalAppSecret=${PERSONAL_SECRET}"
LDFLAGS+=" -X github.com/dropbox/dbxcli/cmd.teamAccessAppKey=${ACCESS_KEY}"
LDFLAGS+=" -X github.com/dropbox/dbxcli/cmd.teamAccessAppSecret=${ACCESS_SECRET}"
LDFLAGS+=" -X github.com/dropbox/dbxcli/cmd.teamManageAppKey=${MANAGE_KEY}"
LDFLAGS+=" -X github.com/dropbox/dbxcli/cmd.teamManageAppSecret=${MANAGE_SECRET}"
gox -ldflags="${LDFLAGS}" \
    -osarch="darwin/amd64 linux/amd64 windows/amd64 linux/arm" \
    -output "dist/{{.Dir}}-{{.OS}}-{{.Arch}}"
