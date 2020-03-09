#!/bin/sh

#
# This script installs PlantUML on the local system, as well as
# installing a convenience script that allows invoking PlantUML
# using the command "plantuml" (instead of manually passing the
# PlantUML JAR file to Java).
#

INSTALL_DIRECTORY=/opt/plantuml

DOWNLOAD_URL=\
http://sourceforge.net/projects/plantuml/files/plantuml.jar/download

# Terminate script if any command results in an error
set -e

install_plant_uml_from_web() {
    
    sudo mkdir -p $INSTALL_DIRECTORY

    cd $INSTALL_DIRECTORY && sudo curl -JLO $DOWNLOAD_URL    
}

install_plant_uml_convenience_script() {

    CONVENIENCE_SCRIPT=/usr/local/bin/plantuml

    cat <<EOF | sudo tee $CONVENIENCE_SCRIPT
    #!/bin/sh

    #
    # This is a convenience script for invoking PlantUML.
    #

    java -jar $INSTALL_DIRECTORY/plantuml.jar "\$@"
EOF

    sudo chmod a+x $CONVENIENCE_SCRIPT    
}

install_plant_uml_from_web

install_plant_uml_convenience_script
