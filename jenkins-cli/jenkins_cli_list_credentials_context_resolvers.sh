#!/bin/bash

echo "
####################################################################
# Listando os contextos e os seus resolvedores (context/resolvers) #
####################################################################
"
java \
    -jar jenkins-cli.jar \
    -s $JENKINS_URL \
    list-credentials-context-resolvers 
echo -e "-----------------------\n\n\n"


