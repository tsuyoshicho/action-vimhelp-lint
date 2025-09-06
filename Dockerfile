FROM thinca/vim:latest@sha256:1b42d85dad7ac5f726f22b9069448e0dd221396192216ef8eb7db9bc0999221f

# reviewdog
ENV REVIEWDOG_VERSION=v0.20.3

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}
RUN apk --update add git && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
