FROM thinca/vim:latest@sha256:71604e55e2a650c1028501410aa9694df74404d05bbe0a349be7d17d0c64cfe1

# reviewdog
ENV REVIEWDOG_VERSION=v0.20.3

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}
RUN apk --update add git && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
