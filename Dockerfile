FROM ubuntu:20.04
MAINTAINER "ceceppa" <info@ceceppa.me>

# Let the conatiner know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

RUN apt update
RUN apt-get install -y --no-install-recommends \
    ca-certificates \
    unzip \
    wget \
    zip \
    libfontconfig-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy the "start" script
COPY init-and-run-tests.sh /init-and-run-tests.sh
RUN chmod 755 /init-and-run-tests.sh

ENTRYPOINT ["/init-and-run-tests.sh"]
