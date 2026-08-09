FROM thinca/vim:latest@sha256:716ad4774cc2bdc0e32ba9379cdd7853d4f11db63b790be548690b2a0ef23e3e

# reviewdog
ENV REVIEWDOG_VERSION=v0.21.0

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}
RUN apk --update add git && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
