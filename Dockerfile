FROM thinca/vim:latest@sha256:ce58d586abf554ef688acfc26172934a39c9693d08a8f6d8fb272edd3b1b6095

# reviewdog
ENV REVIEWDOG_VERSION=v0.21.3

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}
RUN apk --update add git && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
