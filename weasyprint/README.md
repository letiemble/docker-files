# WeasyPrint Docker Image

A Docker image that contains the [WeasyPrint](https://weasyprint.org/) tool.

## Build

To build the image, run the following command:

```bash
docker buildx build --build-arg TOOL_VERSION=XXX -t letiemble/weasyprint:XXX -t letiemble/weasyprint:latest .
```

## Usage

To use the image, run the following command:

```bash
docker run --rm -it -v .:/data letiemble/weasyprint --help
```
