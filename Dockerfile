FROM thinca/vim:latest@sha256:c2b55e91a88e5f03718e1ceb56710d2d4d9bf12ddc21ece849e46170bb570261

# reviewdog
ENV REVIEWDOG_VERSION=v0.21.2

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}
RUN apk --update add git && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
