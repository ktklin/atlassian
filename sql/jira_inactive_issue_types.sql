/**********************************************************************
 * SQL FILE: jira_inactive_notification_schemes
 * Author:   Kurt Klinner
 * Email:    kurt@mobux.de
 * URL:      https://mobux.de
 * Date:     Sat Mar 30 23:57:46 2019
 *
 * Notes:    List unused issue types
 **********************************************************************/

SELECT it.id, it.pname
FROM issuetype it LEFT OUTER JOIN jiraissue ji ON it.id = ji.issuetype
WHERE ji.issuetype is null;
