FROM ghcr.io/stackexchange/dnscontrol:4.15.3@sha256:de0632aad9002b608278783903baa21c67f4defd39691dd1505567069409320b

LABEL repository="https://github.com/Jniklas2/DNSControl-Action"
LABEL maintainer="Jniklas2 <github@sl.crcr.tech>"

LABEL "com.github.actions.name"="DNSControl"
LABEL "com.github.actions.description"="Deploy your DNS configuration to multiple providers."
LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk -U --no-cache upgrade && \
    apk add --no-cache --upgrade bash ca-certificates curl grep libc6-compat && \
    update-ca-certificates

RUN ["dnscontrol", "version"]

COPY entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
