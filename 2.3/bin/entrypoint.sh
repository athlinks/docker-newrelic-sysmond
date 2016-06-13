#!/bin/bash
set -e

generate_config() {
    cat /tmp/nrsysmond.cfg | sed \
        -e "s/@NEW_RELIC_LICENSE_KEY@/$NEW_RELIC_LICENSE_KEY/g" \
        -e "s/@NEW_RELIC_LABEL_ENVIRONMENT@/$NEW_RELIC_LABEL_ENVIRONMENT/g" \
        -e "s/@NEW_RELIC_LABEL_APPLICATION@/$NEW_RELIC_LABEL_APPLICATION/g" \
        -e "s/@NEW_RELIC_LABEL_HOST_DC@/$NEW_RELIC_LABEL_HOST_DC/g" \
        -e "s/@NEW_RELIC_LABEL_REGION@/$NEW_RELIC_LABEL_REGION/g" \
        -e "s/@NEW_RELIC_HOSTNAME@/$NEW_RELIC_HOSTNAME/g" \
        -e "s/@NEW_RELIC_LOG_LEVEL@/$NEW_RELIC_LOG_LEVEL/g" \
      > /etc/nrsysmond.cfg
  }

generate_config
exec $@
