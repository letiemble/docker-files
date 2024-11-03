ARG PYTHON_TAG=3.10-slim
FROM python:${PYTHON_TAG}
ARG TOOL_VERSION=5.7.9

LABEL org.opencontainers.image.title="Check DMARC"
LABEL org.opencontainers.image.description="A Docker image to check the DMARC configuration using the [Check DMARC](https://github.com/domainaware/checkdmarc) tool."
LABEL org.opencontainers.image.version="${TOOL_VERSION}"

# Install the required Python package
RUN pip install checkdmarc==${TOOL_VERSION}

# Expose the volume
RUN mkdir -p /data
VOLUME /data
WORKDIR /data

# Command to run
ENTRYPOINT ["/usr/local/bin/checkdmarc"]
