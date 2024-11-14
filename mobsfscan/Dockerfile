ARG PYTHON_TAG=3.10-slim
FROM python:${PYTHON_TAG}
ARG TOOL_VERSION=0.4.3

LABEL org.opencontainers.image.title="MobSFScan"
LABEL org.opencontainers.image.description="A Docker image to perform a static code analysis using [MobSFScan](https://github.com/MobSF/mobsfscan) tool."
LABEL org.opencontainers.image.version="${TOOL_VERSION}"

# Install the required Python package
RUN pip install mobsfscan==${TOOL_VERSION}

# Expose the volume
RUN mkdir -p /data
VOLUME /data
WORKDIR /data

# Command to run
ENTRYPOINT ["/usr/local/bin/mobsfscan"]
