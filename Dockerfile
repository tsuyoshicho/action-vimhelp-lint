FROM thinca/vim:latest@sha256:923e4e8051d0d29cca447aa09a6249423b792c4016bc56f128f2b0b0d2db9e90

# reviewdog
ENV REVIEWDOG_VERSION=v0.20.3

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}
RUN apk --update add git && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
