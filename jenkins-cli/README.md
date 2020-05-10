# Jenkins Credentials CLI

Nessa pasta você encontra uma variedade de exemplos de utilização do **jenkins-cli** para trabalhar com credenciais. 

Pelo jenkins-cli você consegue criar, atualizar, excluir, listar e obter credenciais global ou organizada dentro de uma pasta. 

É importante salientar que por questão de segurança ao obter uma determinada credencial o valor desta não é exibido. Ele aparece como `<secret-redacted/>`.

---

## Quais exemplos temos?
- **Criar credencial por xml do tipo**:
    - **Texto**: jenkins_cli_create_credentials_by_xml_string.sh
    - **Arquivo**: jenkins_cli_create_credentials_by_xml_filename.sh
    - **Usuário e Senha**: jenkins_cli_create_credentials_by_xml_username_password.sh
    - **Chave SSH**: jenkins_cli_create_credentials_by_xml_basic_ssh_user_private_key.sh
- **Atualizar credencial por xml do tipo**:
    - **Texto**: jenkins_cli_update_credentials_by_xml_string.sh
    - **Arquivo**: jenkins_cli_update_credentials_by_xml_filename.sh
    - **Usuário e Senha**: jenkins_cli_update_credentials_by_xml_username_password.sh
    - **Chave SSH**: jenkins_cli_update_credentials_by_xml_basic_ssh_user_private_key.sh
- **Listar credenciais**: jenkins_cli_list_credentials.sh
- **Obter credencial por xml do tipo**:
    - **Texto**: jenkins_cli_get_credentials_string.sh
    - **Arquivo**: jenkins_cli_get_credentials_filename.sh
    - **Usuário e Senha**: jenkins_cli_get_credentials_username_password.sh
    - **Chave SSH**: jenkins_cli_get_credentials_basic_ssh_user_private_key.sh
- **Excluir credencial por xml do tipo**:
    - **Texto**: jenkins_cli_delete_credentials_string.sh
    - **Arquivo**: jenkins_cli_delete_credentials_filename.sh
    - **Usuário e Senha**: jenkins_cli_delete_credentials_username_password.sh
    - **Chave SSH**: jenkins_cli_delete_credentials_basic_ssh_user_private_key.sh
- **Criar pasta** : jenkins_cli_create_folder.sh
- **Criar credencial na pasta por xml do tipo**:
    - **Texto**: jenkins_cli_folder_create_credentials_by_xml_string.sh
- **Atualizar credencial na pasta por xml do tipo**:
    - **Texto**: jenkins_cli_update_credentials_by_xml_string.sh
- **Listar credencial na pasta**: jenkins_cli_folder_list_credentials.sh
- **Obter credencial na pasta**:
    - **Texto**: jenkins_cli_folder_get_credentials_string.sh
- **Excluir credencial na pasta**:
    - **Texto**: jenkins_cli_folder_delete_credentials_string.sh
- **Excluir pasta** : jenkins_cli_delete_folder.sh

---

## Testando

Para testar o fluxo de criação, atualização, listagem, detalhe e exclusão ajuste as os valores dos `export`  que estão no arquivo `jenkins_cli.sh` e o execute.

```bash
./jenkins_cli.sh
```

*obs: Nunca salve os valores de credenciais escritas arquivos que serão versionados, esse é um exemplo ruim! Utilize um cofre de senhas. Neste exemplo "tomo a liberdade poética" (rs) pois é somente uma demonstração*

---

## Obter o jenkins-cli.jar

O `jenkins-cli.jar` está versionado junto aos arquivos, mas caso deseje baixar um mais atual execute o comando abaixo:

```bash
wget http://JENKINS_HOSTNAME:8080/jnlpJars/jenkins-cli.jar
```

---

## Jenkins-cli e autenticação

### Gerando o token
Acesse o jenkins, clique em seu nome do cabeçalho, depois clique em configurar no menu esquerdo, na sessão token clique em Add new Token, informe um nome e clique em generate. Copie e guarde o token exibido, essa será sua única oportunidade de salva-lo, uma vez que atualize a tela ou saia dela, não pe mais possível ver o token.


### Autenticação por arquivo
```bash
echo 'YOUR_USERNAME:YOUR_API_TOKEN' > jenkins_secret
java -jar ./jenkins-cli.jar -s http://YOUR_JENKINS_HOSTNAME -auth @jenkins_secret who-am-i
```

### Autenticação por arquivo
```bash
echo '' > jenkins_secret
java -jar ./jenkins-cli.jar -s http://YOUR_JENKINS_HOSTNAME -auth "YOUR_USERNAME:YOUR_API_TOKEN" help