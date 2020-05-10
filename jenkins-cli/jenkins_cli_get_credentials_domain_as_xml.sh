echo "
################################################################
# Listando as credenciais por armazem e domínio (store/domain) #
################################################################
"
java \
    -jar jenkins-cli.jar \
    -s $JENKINS_URL \
    get-credentials-domain-as-xml \
    $JENKINS_CREDENTIAL_STORE \
    "domain_hn"
echo -e "-----------------------\n\n\n"
