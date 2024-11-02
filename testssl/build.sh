#!/usr/bin/env bash

TOOL_VERSION=${TOOL_VERSION:-3.0.9}
ARCHIVE=testssl.sh.tar.gz
FOLDER=testssl.sh-$TOOL_VERSION

/usr/bin/curl -L https://github.com/drwetter/testssl.sh/archive/refs/tags/v$TOOL_VERSION.tar.gz -o $ARCHIVE
tar -xzf $ARCHIVE

(cd $FOLDER && docker buildx build --platform linux/amd64,linux/arm64 --push -t letiemble/testssl.sh:$TOOL_VERSION -t letiemble/testssl.sh:latest .)

rm -rf $FOLDER $ARCHIVE
