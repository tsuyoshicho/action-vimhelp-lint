FROM thinca/vim:latest@sha256:0fc2f3ae2ad898f4070553743b53d2b6b102572cc4edf538504b3336cc730572

# reviewdog
ENV REVIEWDOG_VERSION=v0.21.2

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}
RUN apk --update add git && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
