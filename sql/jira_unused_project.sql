/******************************************************************
 * Author:        kurt
 * Email:         kurt@mobux.de
 * URL:           www.mobux.de
 * SQL File:      jira_unused_projects
 * Notes:         List all jira projects that do not contain 
 *                any issues
 ******************************************************************/

SELECT pname
FROM project p LEFT OUTER JOIN jiraissue ji ON p.id = ji.project
WHERE ji.project IS NULL;
