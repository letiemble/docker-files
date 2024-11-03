# Masscan Docker Image

A Docker image that contains the [Masscan](https://github.com/robertdavidgraham/masscan) tool.

## Build

To build the image, run the following command:

```bash
docker buildx build --build-arg TOOL_VERSION=XXX -t letiemble/masscan:XXX -t letiemble/masscan:latest .
```

## Usage

To use the image, run the following command:

```bash
docker run --rm -it -v .:/data letiemble/masscan -iL sample.txt -Pn -p 22,23,80,443 --output-format json --output-filename output.json
```
