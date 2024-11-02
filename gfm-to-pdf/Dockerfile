ARG PYTHON_TAG=3.10-slim
FROM python:${PYTHON_TAG}
ARG TOOL_VERSION=1.21.3

LABEL org.opencontainers.image.title="GFM to PDF Converter"
LABEL org.opencontainers.image.description="A Docker image to convert GitHub Flavored Markdown to PDF using [GFM2PDF](https://github.com/phseiff/github-flavored-markdown-to-html) library."
LABEL org.opencontainers.image.version="${TOOL_VERSION}"

# Install the required packages
RUN apt-get update -y \
    && apt-get install wkhtmltopdf -y \
    && apt-get clean -y

# Install the required Python package
RUN pip install gh-md-to-html[pdf_export]==${TOOL_VERSION}

# Copy the wrapper script
COPY gfm_to_pdf.sh /usr/local/bin/

# Expose the volume
RUN mkdir -p /data
VOLUME /data
WORKDIR /data

# Command to run
ENTRYPOINT ["/usr/local/bin/gfm_to_pdf.sh"]
