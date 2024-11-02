ARG PYTHON_TAG=3.10-slim
FROM python:${PYTHON_TAG}
ARG TOOL_VERSION=2.7.4

LABEL org.opencontainers.image.title="AIL Typo Squatting"
LABEL org.opencontainers.image.description="A Docker image to check for typo-squatting based on the [ail-typo-squatting](https://github.com/typosquatter/ail-typo-squatting) library."
LABEL org.opencontainers.image.version="${TOOL_VERSION}"

# Install the required Python package
RUN pip install ail-typo-squatting==${TOOL_VERSION}

# Copy the wrapper script
COPY check_typo_squatting.sh /usr/local/bin/

# Expose the volume
RUN mkdir -p /data
VOLUME /data
WORKDIR /data

# Command to run
ENTRYPOINT ["/usr/local/bin/check_typo_squatting.sh"]
