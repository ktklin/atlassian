/**********************************************************************
 * SQL FILE: jira_inactive_notification_schemes
 * Author:   Kurt Klinner
 * Email:    kurt@mobux.de
 * URL:      https://mobux.de
 * Date:     Sat Mar 30 23:57:46 2019
 *
 * Notes:    List notification schemes that are NOT assigned TO projects
 **********************************************************************/

SELECT ns.NAME
FROM notificationscheme ns
WHERE ns.NAME NOT IN (SELECT distinct(ns.NAME)
                      FROM project p, nodeassociation na, notificationscheme ns
                      WHERE na.SOURCE_NODE_ENTITY='Project'
                      AND na.SINK_NODE_ENTITY='NotificationScheme'
                      AND na.ASSOCIATION_TYPE='ProjectScheme'
                      AND na.SOURCE_NODE_ID=p.ID
                      AND na.SINK_NODE_ID=ns.ID ) 
AND ns.NAME != 'Default Notification Scheme';
