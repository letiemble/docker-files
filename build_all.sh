#!/usr/bin/env bash
#
# Build all images and push them to Docker Hub
#
AIL_TYPO_SQUATTING_VERSION=2.7.4
CHECK_SSL_CERT_VERSION=2.84.4
CHECKDMARC_VERSION=5.7.9
GFM_TO_PDF_VERSION=1.21.3
MASSCAN_VERSION=1.3.2
MOBILE_SECURITY_FRAMEWORK_MOBSF_RUNNER_VERSION=4.0.7
SSH_AUDIT_VERSION=3.2.0
SUBFINDER_VERSION=2.6.7
TESTSSL_VERSION=3.0.9

# Create a builder instance to build multi-arch images
docker buildx create --name BUILDER --use

# docker buildx build --platform linux/amd64,linux/arm64 --push --build-arg TOOL_VERSION=${AIL_TYPO_SQUATTING_VERSION} -t letiemble/ail-typo-squatting:${AIL_TYPO_SQUATTING_VERSION} -t letiemble/ail-typo-squatting:latest ail-typo-squatting
# docker buildx build --platform linux/amd64,linux/arm64 --push --build-arg TOOL_VERSION=${CHECK_SSL_CERT_VERSION} -t letiemble/check-ssl-cert:${CHECK_SSL_CERT_VERSION} -t letiemble/check-ssl-cert:latest check-ssl-cert
# docker buildx build --platform linux/amd64,linux/arm64 --push --build-arg TOOL_VERSION=${CHECKDMARC_VERSION} -t letiemble/checkdmarc:${CHECKDMARC_VERSION} -t letiemble/checkdmarc:latest checkdmarc
# docker buildx build --platform linux/amd64,linux/arm64 --push --build-arg TOOL_VERSION=${GFM_TO_PDF_VERSION} -t letiemble/gfm-to-pdf:${GFM_TO_PDF_VERSION} -t letiemble/gfm-to-pdf:latest gfm-to-pdf
# docker buildx build --platform linux/amd64,linux/arm64 --push --build-arg TOOL_VERSION=${MASSCAN_VERSION} -t letiemble/masscan:${MASSCAN_VERSION} -t letiemble/masscan:latest masscan
# docker buildx build --platform linux/amd64,linux/arm64 --push --build-arg TOOL_VERSION=${MOBILE_SECURITY_FRAMEWORK_MOBSF_RUNNER_VERSION} -t letiemble/mobile-security-framework-mobsf-runner:${MOBILE_SECURITY_FRAMEWORK_MOBSF_RUNNER_VERSION} -t letiemble/mobile-security-framework-mobsf-runner:latest mobile-security-framework-mobsf-runner
# docker buildx build --platform linux/amd64,linux/arm64 --push --build-arg TOOL_VERSION=${SSH_AUDIT_VERSION} -t letiemble/ssh-audit:${SSH_AUDIT_VERSION} -t letiemble/ssh-audit:latest ssh-audit
# docker buildx build --platform linux/amd64,linux/arm64 --push --build-arg TOOL_VERSION=${SUBFINDER_VERSION} -t letiemble/subfinder:${SUBFINDER_VERSION} -t letiemble/subfinder:latest subfinder

# Special cases
# docker buildx build --platform linux/amd64,linux/arm64 --push --build-arg DOTNET_SDK_VERSION=6.0 --build-arg BERP_VERSION=1.4.0 -t letiemble/berp:1.4.0 -t letiemble/berp:latest berp
# (cd testssl && BUILD_TAG=$TESTSSL_VERSION ./build.sh)

# Remove the builder instance
docker buildx rm BUILDER
