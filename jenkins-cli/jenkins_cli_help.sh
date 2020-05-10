
function help() {
    echo "
    ############
    # COMANDOS #
    ############
    $JENKINS_URL
    "
    java \
        -jar jenkins-cli.jar \
        -s $JENKINS_URL \
        help
    echo -e "-----------------------\n\n\n"
}

