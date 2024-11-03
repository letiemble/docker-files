ARG PYTHON_TAG=3.10-slim
FROM python:${PYTHON_TAG}
ARG TOOL_VERSION=3.2.0

LABEL org.opencontainers.image.title="SSH Audit"
LABEL org.opencontainers.image.description="A Docker image to audit the configuration of SSH for security best practices using the [SSH Audit](https://github.com/jtesta/ssh-audit) tool."
LABEL org.opencontainers.image.version="${TOOL_VERSION}"

# Install the required Python package
RUN pip install ssh-audit==${TOOL_VERSION}

# Expose the volume
RUN mkdir -p /data
VOLUME /data
WORKDIR /data

# Command to run
ENTRYPOINT ["/usr/local/bin/ssh-audit"]
