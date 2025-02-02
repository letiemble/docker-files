ARG PYTHON_TAG=3.10
FROM python:${PYTHON_TAG}
ARG TOOL_VERSION=64.0

LABEL org.opencontainers.image.title="Weasyprint HTML to PDF converter"
LABEL org.opencontainers.image.description="A Docker image to convert HTML files to PDF using the [Weasyprint](https://weasyprint.org/) tool."
LABEL org.opencontainers.image.version="${TOOL_VERSION}"

# Install the required packages
RUN pip install weasyprint==${TOOL_VERSION}

# Expose the volume
RUN mkdir -p /data
VOLUME /data
WORKDIR /data

# Command to run
ENTRYPOINT ["/usr/local/bin/weasyprint"]
