# Check DMARC Docker Image

A Docker image that contains the the [Check DMARC](https://github.com/domainaware/checkdmarc) tool.

## Build

To build the image, run the following command:

```bash
docker buildx build --build-arg TOOL_VERSION=XXX -t letiemble/checkdmarc:XXX -t letiemble/checkdmarc:latest .
```

## Usage

To use the image, run the following command:

```bash
docker run --rm -it -v .:/data letiemble/checkdmarc etiemble.com -o output.json
```
