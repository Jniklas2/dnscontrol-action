FROM ghcr.io/stackexchange/dnscontrol:4.14.3@sha256:eb528feb52f28286c7e534a7ab97f2d0314665fea023c71d5e79e3f88bc75152

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
