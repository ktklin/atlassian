import com.atlassian.jira.component.ComponentAccessor

def schemeManager = ComponentAccessor.workflowSchemeManager
def sb = new StringBuilder()
def doExecute = false

schemeManager.schemeObjects.each {
  try{
	  if(schemeManager.getProjectsUsing(schemeManager.getWorkflowSchemeObj(it.id)).size() == 0) {
      if (doExecute) {
			  sb.append("Deleting unused workflow scheme: <b>${it.name}</b><br/>")
			  schemeManager.deleteScheme(it.id)
      }
      else {
        sb.append ("Unused workflow scheme: <b>${it.name}</b><br/>")
      }
		}
	}
	catch(Exception e) {
		sb.append("Error: " + e + "\n")
	}
}
return sb.toString()
