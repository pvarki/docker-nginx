#!/bin/bash
set -ex
cp -r /nginx_templates/$NGINX_TEMPLATE_DIR /etc/nginx/templates
cp -r /nginx_templates/includes /etc/nginx/includes

# The SCEP responder is the only optional upstream: a deployment without an MDM does not run it.
# envsubst replaces only variables that are set, so an unset one survives as a literal and nginx
# refuses to start. Default them and an absent responder costs a 502 on /scep and nothing else.
export NGINX_SCEP_UPSTREAM="${NGINX_SCEP_UPSTREAM:-rmscep}"
export NGINX_SCEP_UPSTREAM_PORT="${NGINX_SCEP_UPSTREAM_PORT:-8000}"

. /docker-entrypoint.sh
