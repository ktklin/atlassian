import com.atlassian.jira.component.ComponentAccessor
import com.atlassian.jira.config.IssueTypeManager

def issueTypeManager = ComponentAccessor.getComponent(IssueTypeManager)
def sb = new StringBuilder()
def doExecute = false

issueTypeManager.issueTypes.each {
  try {
    if (!issueTypeManager.hasAssociatedIssues(it)) {
      if (doExecute) {
        sb.append("Deleting unused issue type: <b>${it.name}</b><br/>")
        // Set the Default of Task Id
        String replaceIssueTypeId = "1"
        if (it.isSubTask()){
          // Id of Sub-Task
          replaceIssueTypeId = "5"
        }
        issueTypeManager.removeIssueType(it.id, replaceIssueTypeId)
      }
      else{
        sb.append ("Unused issue type : <b>${it.name}</b><br/>")
      }
    }
 }
 catch (Exception e) {
  sb.append("Error: " + e + "\n")
 }
}
return sb.toString()
