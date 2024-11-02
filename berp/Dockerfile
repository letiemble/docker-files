ARG DOTNET_SDK_VERSION=6.0
FROM mcr.microsoft.com/dotnet/sdk:${DOTNET_SDK_VERSION}
ARG BERP_VERSION=1.4.0

LABEL org.opencontainers.image.title="BERP Parser"
LABEL org.opencontainers.image.description="A Docker image to execute the BERP parser generator tool."
LABEL org.opencontainers.image.version="${BERP_VERSION}"

# Install Berp
RUN dotnet tool install Berp --version ${BERP_VERSION} --tool-path /usr/local/bin

# Expose the volume
RUN mkdir -p /data
VOLUME /data
WORKDIR /data

ENTRYPOINT ["/usr/local/bin/berp"]
