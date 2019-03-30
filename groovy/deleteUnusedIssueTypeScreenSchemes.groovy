import com.atlassian.jira.component.ComponentAccessor
import com.atlassian.jira.issue.fields.screen.issuetype.IssueTypeScreenSchemeManager

def schemeManager = ComponentAccessor.issueTypeScreenSchemeManager
def sb = new StringBuilder()
def doExecute = false

schemeManager.issueTypeScreenSchemes.each {
    if (it.isDefault()) {
        return
    }
    try {
      if (schemeManager.getProjects(it).size() < 1) {
        if (doExecute) {
          sb.append("Deleting unused issue type screen scheme: <b>${it.name}</b><br/>")
          schemeManager.removeIssueTypeScreenScheme(it)
        }
        else {
          sb.append ("Unused issuetype screen scheme: <b>${it.name}</b><br/>")
        }
      }
    }
    catch (Exception e) {
        sb.append("Error: " + e + "\n")
    }
}

return sb.toString()
