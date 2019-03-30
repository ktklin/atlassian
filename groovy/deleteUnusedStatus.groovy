import com.atlassian.jira.component.ComponentAccessor
import com.atlassian.jira.config.StatusManager;

StatusManager statusManager = ComponentAccessor.getComponent(StatusManager.class)

def sb = new StringBuilder()

statusManager.getStatuses().each {
    //try & catch block had been added as no method exists
    //from a status perspective if the status is associated 
    //to workflows, so we iterate over all status fields
    //remove the unassociated ones in the try block
    //while we silently ignore the message that a status is 
    //still in use within the catch part
    try {
    	statusManager.removeStatus("${it.id}");
    	sb.append ("Deleting unused status: ${it.name}<br>\n"); 
    }
    catch (Exception e)
    { }
}
return sb.toString()
