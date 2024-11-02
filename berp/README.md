# BERP Docker Image

A Docker image to execute the BERP parser inside a container without needing to install a [.NET runtime](https://dotnet.microsoft.com/download) and the [BERP parser](https://github.com/gasparnagy/berp) on your machine.

## Build

To build the image, run the following command:

```bash
docker buildx build --build-arg DOTNET_SDK_VERSION=6.0 --build-arg BERP_VERSION=1.4.0 -t letiemble/berp:1.4.0 -t letiemble/berp:latest berp
```

## Usage

To use the image, run the following command:

```bash
docker run --rm -it -v .:/data letiemble/berp -g grammar.berp -t template.razor -o output.cs --noBOM
```
