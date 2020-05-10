# Jenkins Credentials CLI

## Obter o jenkins-cli.jar
```sh
wget http://YOUR_JENKINS_HOSTNAME/jnlpJars/jenkins-cli.jar
```

## Autenticação

### By file
```sh
echo 'YOUR_USERNAME:YOUR_API_TOKEN' > jenkins_secret
java -jar ./jenkins-cli.jar -s http://YOUR_JENKINS_HOSTNAME -auth @jenkins_secret who-am-i
```sh


### By string
```sh
echo '' > jenkins_secret
java -jar ./jenkins-cli.jar -s http://YOUR_JENKINS_HOSTNAME -auth "YOUR_USERNAME:YOUR_API_TOKEN" help
```



## List jobs
```sh
java -jar ./jenkins-cli.jar -s http://YOUR_JENKINS_HOSTNAME list-jobs
```

```sh
java -jar ./jenkins-cli.jar -s http://YOUR_JENKINS_HOSTNAME get-job foo
```

```sh
cat job.xml | java -jar ./jenkins-cli.jar -s http://YOUR_JENKINS_HOSTNAME create-job foo
```