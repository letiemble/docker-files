# Test SSL Docker image

Custom build of [zmap/zmap](https://github.com/zmap/zmap) Docker image to enable multi-architecture support.

## Build

To build the image, run the following command:

```shell
TOOL_VERSION=v4.3.1 ./build.sh
```

## Usage

To use the image, run the following command:

```shell
docker run --rm -it -v .:/data letiemble/zmap --help
```
