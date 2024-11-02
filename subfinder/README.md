# Project Discovery Subfinder Docker Image

A Docker image that contains the [Project Discovery Subfinder](https://github.com/projectdiscovery/subfinder) tool.

## Build

To build the image, run the following command:

```bash
docker buildx build --build-arg TOOL_VERSION=2.6.7 -t letiemble/subfinder:2.6.7 -t letiemble/subfinder:latest .
```

## Usage

To use the image, run the following command:

```bash
docker run --rm -it -v .:/data letiemble/subfinder -all -cs -duc -nW -oI -oJ -o output.ndjson -d google.com
```
