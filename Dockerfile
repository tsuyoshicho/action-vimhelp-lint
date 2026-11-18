FROM thinca/vim:latest@sha256:1fea921600e6a6a074e1666fb1a33ab3899a8b44ce7c326aa2d9da2e2b1d014b

# reviewdog
ENV REVIEWDOG_VERSION=v0.21.3

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}
RUN apk --update add git && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
