# syntax=docker/dockerfile:1.5
ARG version_ui=develop
FROM ghcr.io/momentum-xyz/ui-client:$version_ui as ui-client

FROM nginx:1.23.4-alpine as runtime

ENV CONTROLLER_URL=http://controller:4000

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./forwarding.conf /etc/nginx/conf.d/forwarding.conf
COPY ./site.conf.template /etc/nginx/templates/default.conf.template
COPY --from=ui-client --link /opt/srv /srv/ui

