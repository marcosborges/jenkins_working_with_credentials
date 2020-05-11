import com.cloudbees.plugins.credentials.Credentials
import com.cloudbees.plugins.credentials.CredentialsProvider
import org.jenkinsci.plugins.plaincredentials.impl.StringCredentialsImpl
import org.jenkinsci.plugins.plaincredentials.impl.FileCredentialsImpl
import com.cloudbees.plugins.credentials.impl.UsernamePasswordCredentialsImpl
import com.cloudbees.jenkins.plugins.sshcredentials.impl.BasicSSHUserPrivateKey

CredentialsProvider.lookupCredentials(
    Credentials.class,
    Jenkins.getInstance(),
    null,
    null
).each {
    switch (it.getClass()) {
        case StringCredentialsImpl:
            println "${it.id}:${it.getSecret()}"
            break
        case FileCredentialsImpl:
            println "${it.id}:${it.getFileName()}/${it.getContent()}"
            break;
        case UsernamePasswordCredentialsImpl:
            println "${it.id}:${it.getUsername()}@${it.getPassword()}"  
            break;
        case BasicSSHUserPrivateKey:
            println "${it.id}:${it.getUsername()}"  
            break;
    }
}

return true