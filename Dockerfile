FROM thinca/vim:latest@sha256:1983c89e27353cfe619b4d7f3876ad9cda230e7f456ce75a003b610120db18eb

# reviewdog
ENV REVIEWDOG_VERSION=v0.21.3

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}
RUN apk --update add git && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
