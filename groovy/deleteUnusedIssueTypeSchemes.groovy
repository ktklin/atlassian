import com.atlassian.jira.component.ComponentAccessor

def schemeManager = ComponentAccessor.issueTypeSchemeManager
def sb = new StringBuilder()
def doExecute = false

schemeManager.allSchemes.each {
  if (!schemeManager.isDefaultIssueTypeScheme(it)){
    try {
        if (it.associatedProjectIds.size() == 0) {
          if (doExecute) {
            sb.append("Deleting unused issue type scheme: <b>${it.name}</b><br/>") 
            schemeManager.deleteScheme(it)
          }
          else {
            sb.append ("Unused issue type scheme: <b>${it.name}</b><br/>")
          }
        }
    }
    catch (Exception e) {
        sb.append("Error: " + e + "\n")
    }
  }
}
return sb.toString()
