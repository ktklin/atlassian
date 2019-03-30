import com.atlassian.jira.component.ComponentAccessor

def workflowManager = ComponentAccessor.workflowManager
def workflowSchemeManager = ComponentAccessor.workflowSchemeManager
def sb = new StringBuffer()
def doExecute = false

workflowManager.workflows.each {
  if(!it.systemWorkflow) {
    try{
      def schemes = workflowSchemeManager.getSchemesForWorkflow(it)
      if (schemes.size() == 0) {
        if (doExecute) {
          sb.append("Deleting unused workflow: <b>${it.name}</b><br/>")
          workflowManager.deleteWorkflow(it)
        }
        else {
          sb.append ("Unused workflow: <b>${it.name}</b><br/>")
        }
      }
    }
    catch(Exception e) {
     sb.append("Error: " + e + "\n")
    }
  }
}
return sb.toString()
