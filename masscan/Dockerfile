ARG ALPINE_TAG=3.20

# ----- BUILD STAGE -----

FROM alpine:${ALPINE_TAG} AS build
ARG TOOL_VERSION=1.3.2

# Install the required packages
RUN apk --no-cache upgrade \
    && apk --no-cache add build-base clang clang-dev curl libpcap-dev linux-headers

# Download, extract and build the source code
WORKDIR /build
RUN curl -L https://github.com/robertdavidgraham/masscan/archive/refs/tags/${TOOL_VERSION}.tar.gz -o masscan.tar.gz \
    && tar -xzf masscan.tar.gz \
    && cd masscan-${TOOL_VERSION} \
    && make
RUN cp masscan-${TOOL_VERSION}/bin/masscan .

# ----- FINAL STAGE -----

FROM alpine:${ALPINE_TAG}
ARG TOOL_VERSION=1.3.2

LABEL org.opencontainers.image.title="Network Mass scanner"
LABEL org.opencontainers.image.description="A Docker image to perform network scans using the [Masscan](https://github.com/robertdavidgraham/masscan) tool."
LABEL org.opencontainers.image.version="${TOOL_VERSION}"

# Install the required packages
RUN apk --no-cache upgrade \
    && apk --no-cache add ca-certificates libpcap-dev

# Copy the binary
COPY --from=build /build/masscan /usr/local/bin/

# Expose the volume
RUN mkdir -p /data
VOLUME /data
WORKDIR /data

# Command to run
ENTRYPOINT ["/usr/local/bin/masscan"]
