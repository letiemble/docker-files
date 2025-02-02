#!/usr/bin/env bash

TOOL_VERSION=${TOOL_VERSION:-4.3.1}
ARCHIVE=zmap.tar.gz
FOLDER=zmap-$TOOL_VERSION

/usr/bin/curl -L https://github.com/zmap/zmap/archive/refs/tags/v$TOOL_VERSION.tar.gz -o $ARCHIVE
tar -xzf $ARCHIVE

(cd $FOLDER && docker buildx build --platform linux/amd64,linux/arm64 --push -t letiemble/zmap:$TOOL_VERSION -t letiemble/zmap:latest .)

rm -rf $FOLDER $ARCHIVE
