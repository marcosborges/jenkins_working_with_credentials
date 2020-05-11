# Jenkins Credentials as Code

Jenkins configuration as code é a uma as formas mais elegantes de trabalhar com o setup do Jenkins, você pode ter todas as configurações realizadas no jenkins espelhadas em um arquivo YAML.

Para mais detalhes acesse https://github.com/jenkinsci/configuration-as-code-plugin/blob/master/README.md.

O modelo ***"jenkins_as_code_create_credentials.yml"*** exemplifica como formatar e definir os 4 principais tipos de credenciais: string, filename, chave, ssh e usuário com senha.

Para utilizar o Jenkins Configuration as Code é necessário a instalação do plugin, assim que o plugin for instalado um novo item será adicionado em sua área de gerenciamento do Jenkins.

Através deste item você vai conseguir exportar um YAML com suas aconfigurações atuais e também poderá rodar YAML versionados para configurar um novo jenkins.

*obs: Cuidado, não rode diretamente o exemplo pois ele vai apagar todas as credenciais previamente criadas! A configuração contidano seu YAML é o espelho da configuração do seu Jenkins, então a configuração removida do YAML será removida do seu Jenkins* 

