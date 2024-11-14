# Check DMARC Docker Image

A Docker image that contains the [MobSFScan](https://github.com/MobSF/mobsfscan) tool.

## Build

To build the image, run the following command:

```bash
docker buildx build --build-arg TOOL_VERSION=XXX -t letiemble/mobsfscan:XXX -t letiemble/mobsfscan:latest .
```

## Usage

To use the image, run the following command:

```bash
docker run --rm -it -v .:/data letiemble/mobsfscan --json -o mobsfscan.json .
```
