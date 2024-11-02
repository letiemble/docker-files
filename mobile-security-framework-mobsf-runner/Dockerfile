ARG ALPINE_TAG=3.20
FROM alpine:${ALPINE_TAG}
ARG TOOL_VERSION=4.0.7

LABEL org.opencontainers.image.title="MobSF Runner"
LABEL org.opencontainers.image.description="Docker image to perform a scan with the Mobile Security Framework (MobSF) Web Application."
LABEL org.opencontainers.image.version="${TOOL_VERSION}"

# Install required packages
RUN apk --no-cache upgrade \
    && apk add --no-cache bash curl jq

# Create a dedicated directory to host the script
COPY mobsf_scan.sh /usr/local/bin/

# Expose the volume
RUN mkdir -p /data
VOLUME /data
WORKDIR /data

# Command to run
ENTRYPOINT [ "/usr/local/bin/mobsf_scan.sh" ]
