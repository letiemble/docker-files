# The Debian base image to use
ARG DEBIAN_TAG=10-slim

# ----- BUILD STAGE -----

FROM debian:${DEBIAN_TAG} AS build
ARG TOOL_VERSION=2.84.4

# Install the required packages
RUN apt-get update -yq \
    && apt-get install curl -yq

# Download and extract the source code
WORKDIR /build
RUN curl -L https://github.com/matteocorti/check_ssl_cert/archive/refs/tags/v${TOOL_VERSION}.tar.gz -o check_ssl_cert.tar.gz \
    && tar -xzf check_ssl_cert.tar.gz
RUN cp check_ssl_cert-${TOOL_VERSION}/check_ssl_cert .

# ----- FINAL STAGE -----

FROM debian:${DEBIAN_TAG}
ARG TOOL_VERSION=2.84.4

LABEL org.opencontainers.image.title="Check SSL Certificate"
LABEL org.opencontainers.image.description="A Docker image to check the SSL certificate of a website using the [Check SSL Cert](https://github.com/matteocorti/check_ssl_cert) tool."
LABEL org.opencontainers.image.version="${TOOL_VERSION}"

# Install the required packages
RUN apt-get update -y \
    && apt-get install bc ca-certificates curl expect file host nmap openssl -y \
    && apt-get clean -y

# Copy the binary
COPY --from=build /build/check_ssl_cert /usr/local/bin/

# Expose the volume
RUN mkdir /data
VOLUME /data
WORKDIR /data

# Command to run
ENTRYPOINT ["/usr/local/bin/check_ssl_cert"]
