# SSH Audit Docker Image

A Docker image that contains the [SSH Audit](https://github.com/jtesta/ssh-audit) tool.

## Build

To build the image, run the following command:

```bash
docker buildx build --build-arg TOOL_VERSION=XXX -t letiemble/ssh-audit:XXX -t letiemble/ssh-audit:latest .
```

## Usage

To use the image, run the following command:

```bash
docker run --rm -it -v .:/data letiemble/ssh-audit -j ssh.example.com
```
