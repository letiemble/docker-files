# Mobile Security Framework (MobSF) Runner

A Docker image to scan a target with the [Mobile Security Framework (MobSF)](https://github.com/MobSF/Mobile-Security-Framework-MobSF) web application.

The runner scripts:
- upload the target file to the MobSF web application
- start the scan
- download the scoreboard
- download the PDF report

## Build

To build the image, run the following command:

```bash
docker buildx build --build-arg TOOL_VERSION=XXX -t letiemble/mobile-security-framework-mobsf-runner:XXX -t letiemble/mobile-security-framework-mobsf-runner:latest .
```

## Usage

To use the image, run the following commands:

```shell
docker run --name mobsf -e 'MOBSF_API_KEY=APIKEY' -p 8000:8000 -d opensecurity/mobile-security-framework-mobsf
docker run --rm -it -v .:/data letiemble/mobile-security-framework-mobsf-runner MyApp.apk http://host.docker.internal:8000 APIKEY
```

## Usage with compose

A [Docker Compose file](./docker-compose.yml) is provided to demonstrate how to run both the MobSF web application and the runner.
When the runner is done, the container will stop and will be removed.

```shell
MOBSF_VERSION=XXX INPUT_FILE=MyApp.apk docker-compose up --abort-on-container-exit; docker-compose rm -f
```

Both the application package and the results are stored in the current directory.
