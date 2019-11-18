FROM starlabio/ubuntu-base:1.5
MAINTAINER Star Lab <maintainers@starlab.io>

RUN apt-get update && \
    apt-get --quiet --yes install \
        graphviz pandoc texlive-xetex xsltproc mscgen librsvg2-bin && \
        apt-get autoremove -y && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
