#!/bin/bash

function delete_folder() {
    java \
        -jar jenkins-cli.jar \
        -s $JENKINS_URL \
        delete-job \
        "FOLDER_A" 
}