import com.atlassian.jira.component.ComponentAccessor
import com.atlassian.jira.notification.NotificationSchemeManager

NotificationSchemeManager notificationSchemeManager = ComponentAccessor.getNotificationSchemeManager()

def sb = new StringBuilder()
def doExecute = false

notificationSchemeManager.getUnassociatedSchemes().each {
  try{     
    if (doExecute) {
      sb.append ("Deleting unused notification scheme: <b>${it.name}</b><br/>")
      def sId = Long.valueOf("${it.id}")
      notificationSchemeManager.deleteScheme(sId)
    }
    else {
      sb.append ("Unused notification scheme: <b>${it.name}</b><br/>")
    }
  }
 catch (Exception e) {
  sb.append("Error: " + e + "\n")
 }
}

return sb.toString()
