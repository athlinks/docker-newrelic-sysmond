# New Relic SysmonD Docker Image Based on Alpine

## Run (Manually)
```
docker run -d \
--name newrelic \
--privileged \
-e NEW_RELIC_LICENSE_KEY=<NEW_RELIC_KEY> \
-e NEW_RELIC_HOSTNAME=<DESIRED_HOSTNAME> \
-e NEW_RELIC_LABEL_ENVIRONMENT=<ENVIRONMENT> \
-e NEW_RELIC_LABEL_APPLICATION=<APPLICATION> \
-e NEW_RELIC_LABEL_HOST_DC=<DC> \
-e NEW_RELIC_LABEL_REGION=<REGION> \
-v /dev:/dev:ro \
-v /sys/fs/cgroup:/sys/fs/cgroup:ro \
-v /var/run/docker.sock:/var/run/docker.sock athlinks/newrelic-sysmond:2.3
```

## Run (Docker Compose)
```
git clone https://github.com/athlinks/docker-newrelic-sysmond.git
cd docker-newrelic-sysmond/2.3
```

Replace the necessary environment variables in the docker-compose.yml then run:
```
docker-compose up -d
```
