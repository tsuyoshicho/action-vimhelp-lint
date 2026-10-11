FROM thinca/vim:latest@sha256:e6db7cd9157dc6167eb808c4edec5030174f0f14cb6674a31b00971b3e9784a2

# reviewdog
ENV REVIEWDOG_VERSION=v0.21.2

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}
RUN apk --update add git && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
