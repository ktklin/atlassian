import com.atlassian.jira.component.ComponentAccessor
import com.atlassian.jira.issue.fields.screen.FieldScreenFactory
import com.atlassian.jira.issue.fields.screen.FieldScreenManager
import com.atlassian.jira.issue.fields.screen.FieldScreenSchemeManager
import com.atlassian.jira.web.action.admin.issuefields.screens.ViewFieldScreens
import com.atlassian.jira.workflow.WorkflowManager

FieldScreenManager fieldScreenManager = ComponentAccessor.getFieldScreenManager()
FieldScreenFactory fieldScreenFactory = ComponentAccessor.getComponent(FieldScreenFactory.class)
FieldScreenSchemeManager fieldScreenSchemeManager = ComponentAccessor.getComponent(FieldScreenSchemeManager.class)
WorkflowManager workflowManager = ComponentAccessor.getWorkflowManager()
ViewFieldScreens viewFieldScreens = new ViewFieldScreens(fieldScreenManager, fieldScreenFactory, fieldScreenSchemeManager, workflowManager)

def sb = new StringBuffer()
def doExecute = false

for(def fieldScreen : fieldScreenManager.getFieldScreens()) {
  if(viewFieldScreens.isDeletable(fieldScreen)) {
    if (doExecute) {
      sb.append("Deleleting unused screen: <b>${fieldScreen.getName()}</b><br/>")
      fieldScreenManager.removeFieldScreen(fieldScreen.getId())
    }
    else {
      sb.append ("Unused screen: <b>${fieldScreen.getName()}</b><br/>")
    }
  }
}

return sb.toString()
