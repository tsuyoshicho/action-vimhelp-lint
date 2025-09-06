FROM thinca/vim:latest@sha256:c645a4dae3128f49a53f1166d4f3df3f0470f6559db14c8b0a0ac32037c31cf1

# reviewdog
ENV REVIEWDOG_VERSION=v0.20.3

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}
RUN apk --update add git && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
