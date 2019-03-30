/**********************************************************************
 * SQL FILE: jira_inactive_notification_schemes
 * Author:   Kurt Klinner
 * Email:    kurt@mobux.de
 * URL:      https://mobux.de
 * Date:     Sat Mar 30 23:57:46 2019
 *
 * Notes:    List unused issue type schemes
 **********************************************************************/

SELECT fcs.configname  
FROM configurationcontext cc RIGHT  OUTER JOIN fieldconfigscheme fcs ON cc.fieldconfigscheme=fcs.id 
WHERE fcs.fieldid='issuetype' 
AND cc.project is null
and fcs.configname != 'Default Issue Type Scheme'  
ORDER BY cc.id
