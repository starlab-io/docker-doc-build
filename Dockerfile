FROM starlabio/ubuntu-base:1.7
MAINTAINER Star Lab <maintainers@starlab.io>

ARG plant_uml_directory=/opt/plantuml
ARG plant_uml=plantuml.jar
ARG plant_uml_launcher=/usr/local/bin/plantuml

ADD $plant_uml $plant_uml_directory/$plant_uml

RUN echo\
    #/bin/sh
    #
    # This is a convenience script for launching PlantUML.
    #
    java -jar $plant_uml_directory/$plant_uml "\$@"\
>> $plant_uml_launcher

RUN chmod a+x $plant_uml_launcher

RUN apt-get update && \
    apt-get --quiet --yes install \
        default-jre-headless \
        graphviz \
        latexmk \
        librsvg2-bin \
        mscgen \
        pandoc \
        sudo \
        texlive-xetex \
        xsltproc && \
    echo "ALL ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/all && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*

RUN update-alternatives --install  /usr/bin/python python /usr/bin/python3 1000

RUN pip3 install \
        pyaml \
        myst-parser \
        requests \
        sphinx \
        texttable \
        yamlordereddictloader
