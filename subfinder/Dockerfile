ARG ALPINE_TAG=3.20
ARG GOLANG_TAG=1.23

# ----- BUILD STAGE -----

FROM golang:${GOLANG_TAG}-alpine${ALPINE_TAG} AS build
ARG TOOL_VERSION=2.6.7

RUN apk --no-cache upgrade && \
    apk --no-cache add build-base curl gzip

# Download and build the Subfinder tool
WORKDIR /build
RUN curl -L https://github.com/projectdiscovery/subfinder/archive/refs/tags/v${TOOL_VERSION}.tar.gz -o subfinder.tgz \
    && tar -xzf subfinder.tgz \
    && cd subfinder-${TOOL_VERSION}/v2 \
    && go mod download \
    && go build ./cmd/subfinder
RUN cp subfinder-${TOOL_VERSION}/v2/subfinder .

# ----- FINAL STAGE -----

FROM golang:${GOLANG_TAG}-alpine${ALPINE_TAG}
ARG TOOL_VERSION=2.6.7
    
LABEL org.opencontainers.image.title="Project Discovery Subfinder"
LABEL org.opencontainers.image.description="A Docker image to gather DNS sub-domains using the [Project Discovery Subfinder](https://github.com/projectdiscovery/subfinder) tool."
LABEL org.opencontainers.image.version="${TOOL_VERSION}"

RUN apk --no-cache upgrade && \
    apk --no-cache add bind-tools ca-certificates

# Copy the built binary
COPY --from=build /build/subfinder /usr/local/bin/

# Expose the volume
RUN mkdir /data
VOLUME /data
WORKDIR /data

# Command to run
ENTRYPOINT ["/usr/local/bin/subfinder"]
