FROM ubuntu:16.04

LABEL maintainer="nico@nicoschreiner.de"

# install varnishcache and clean APT-Cache
RUN apt-get update && \
    apt-get install -y curl \
                       gnupg \
                       apt-transport-https && \
    curl -L https://packagecloud.io/varnishcache/varnish5/gpgkey | apt-key add - && \
    apt-get update && \
    echo deb https://packagecloud.io/varnishcache/varnish5/ubuntu/ xenial main > /etc/apt/sources.list.d/varnishcache_varnish5.list && \
    echo deb-src https://packagecloud.io/varnishcache/varnish5/ubuntu/ xenial main >> /etc/apt/sources.list.d/varnishcache_varnish5.list && \
    apt-get update && \
    apt-get install -y varnish && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# copy run.sh
COPY run.sh /tmp/run.sh
RUN chmod +x /tmp/run.sh

# other stuff
VOLUME "/data"
EXPOSE 80
CMD ["/tmp/run.sh"]
