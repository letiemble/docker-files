# GFM2PDF Docker Image

A Docker image that contains the [GFM2PDF](https://github.com/phseiff/github-flavored-markdown-to-html) tool.

## Build

To build the image, run the following command:

```bash
docker buildx build --build-arg TOOL_VERSION=XXX -t letiemble/gfm-to-pdf:XXX -t letiemble/gfm-to-pdf:latest .
```

## Usage

To use the image, run the following command:

```bash
docker run --rm -it -v .:/data letiemble/gfm-to-pdf README.md -p README.pdf
```
