# AIL Typo Squatting Docker Image

A Docker image that contains the [AIL Typo Squatting](https://github.com/typosquatter/ail-typo-squatting) tool.

## Build

To build the image, run the following command:

```bash
docker buildx build --build-arg TOOL_VERSION=2.7.4 -t letiemble/ail-typo-squatting:2.7.4 .
```

## Usage

To use the image, run the following command:

```bash
docker run --rm -it -v .:/data letiemble/ail-typo-squatting -a -dnsr -o output -fo yaml -v -dn google.com
```
