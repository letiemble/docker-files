# Test SSL Docker image

Custom build of [drwetter/testssl.sh](https://github.com/drwetter/testssl.sh) Docker image to enable multi-architecture support.

## Build

To build the image, run the following command:

```shell
BUILD_TAG=3.0.9 ./build_drwetter_testssl.sh
```

## Usage

To use the image, run the following command:

```shell
docker run --rm -it -v .:/data letiemble/testssl.sh --jsonfile /data/output.json www.google.com
```