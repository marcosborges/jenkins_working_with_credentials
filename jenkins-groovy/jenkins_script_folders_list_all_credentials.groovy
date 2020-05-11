import com.cloudbees.hudson.plugins.folder.Folder;
import com.cloudbees.hudson.plugins.folder.properties.FolderCredentialsProvider.FolderCredentialsProperty;
import hudson.security.ACL
import com.cloudbees.plugins.credentials.Credentials
import com.cloudbees.plugins.credentials.CredentialsProvider
import com.cloudbees.plugins.credentials.domains.URIRequirementBuilder
import org.jenkinsci.plugins.plaincredentials.impl.StringCredentialsImpl
import org.jenkinsci.plugins.plaincredentials.impl.FileCredentialsImpl
import com.cloudbees.plugins.credentials.impl.UsernamePasswordCredentialsImpl
import com.cloudbees.jenkins.plugins.sshcredentials.impl.BasicSSHUserPrivateKey

Jenkins.getInstance().getAllItems(Folder.class).each {
    def folder = it
    println "FOLDER: ${folder.getFullName()}"
    folder.getProperties(
    )?.get(
        FolderCredentialsProperty.class
    )?.getStore(
    )?.getProvider(
    )?.getCredentials(
        Credentials.class, 
        folder,
        ACL.SYSTEM,
        URIRequirementBuilder.fromUri("_").build()
    ).each {
        switch (it.getClass()) {
            case StringCredentialsImpl:
                println "-${it.id}:${it.getSecret()}"
                break
            case FileCredentialsImpl:
                println "-${it.id}:${it.getFileName()}/${it.getContent()}"
                break;
            case UsernamePasswordCredentialsImpl:
                println "-${it.id}:${it.getUsername()}@${it.getPassword()}"  
                break;
            case BasicSSHUserPrivateKey:
                println "-${it.id}:${it.getUsername()}"  
                break;
        }
    }
}
return true