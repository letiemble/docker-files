# Check SSL Cert Docker Image

A Docker image that contains the [Check SSL Cert](https://github.com/matteocorti/check_ssl_cert) tool.

## Build

To build the image, run the following command:

```bash
docker buildx build --build-arg TOOL_VERSION=XXX -t letiemble/check-ssl-cert:XXX -t letiemble/check-ssl-cert:latest .
```

## Usage

To use the image, run the following command:

```bash
docker run --rm -it -v .:/data letiemble/check-ssl-cert --all-local -v -H www.google.com
```
