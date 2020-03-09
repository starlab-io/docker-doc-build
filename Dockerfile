FROM starlabio/ubuntu-base:1.5
MAINTAINER Star Lab <maintainers@starlab.io>

COPY install-plant-uml.sh .

RUN apt-get update && \
    apt-get --quiet --yes install \
        default-jre-headless \
        graphviz \
        librsvg2-bin \
        mscgen \
        pandoc \
        sudo \
        texlive-xetex \
        xsltproc && \
    ./install-plant-uml.sh && \
    echo "ALL ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/all && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*

RUN pip install \
        argparse \
        pyaml \
        requests \
        texttable \
        yamlordereddictloader
