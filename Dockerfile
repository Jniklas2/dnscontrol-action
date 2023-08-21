FROM stackexchange/dnscontrol:4.1.20@sha256:b8a52a17ae8f25dd161fbad19c365b510d547b8547ed52f79df94b7889bcf7e8

LABEL repository="https://github.com/Jniklas2/DNSControl-Action"
LABEL maintainer="Jniklas2 <github@sl.crcr.tech>"

LABEL "com.github.actions.name"="DNSControl"
LABEL "com.github.actions.description"="Deploy your DNS configuration to multiple providers."
LABEL "com.github.actions.icon"="cloud"
LABEL "com.github.actions.color"="yellow"

RUN apk -U --no-cache upgrade && \
    apk add --no-cache bash ca-certificates curl libc6-compat

RUN ["dnscontrol", "version"]

COPY README.md entrypoint.sh bin/filter-preview-output.sh /
ENTRYPOINT ["/entrypoint.sh"]
