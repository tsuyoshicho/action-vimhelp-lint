FROM thinca/vim:latest@sha256:9768996045377af48bed903aeb70b1c76e94e5177242ef929f211fcbe7fc9ed1

# reviewdog
ENV REVIEWDOG_VERSION=v0.21.3

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}
RUN apk --update add git && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
