FROM thinca/vim:latest@sha256:0228f04813beda675a120f9f0e2c18ae5e90f00f798922c60df6f0c3a61e4083

# reviewdog
ENV REVIEWDOG_VERSION=v0.21.2

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}
RUN apk --update add git && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
