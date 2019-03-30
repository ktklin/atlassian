/**********************************************************************
 * SQL FILE: jira_inactive_notification_schemes
 * Author:   Kurt Klinner
 * Email:    kurt@mobux.de
 * URL:      https://mobux.de
 * Date:     Sat Mar 30 23:57:46 2019
 *
 * Notes:    List permission schemes that are not assigned to projects
 **********************************************************************/

SELECT ps.NAME
FROM permissionscheme ps
WHERE ps.NAME NOT IN (SELECT distinct(ps.NAME)
                      FROM project  p, nodeassociation  na, permissionscheme ps
                      WHERE na.SOURCE_NODE_ENTITY='Project'
                      AND na.SINK_NODE_ENTITY='PermissionScheme'
                      AND na.ASSOCIATION_TYPE='ProjectScheme'
                      AND na.SOURCE_NODE_ID=p.ID
                      AND na.SINK_NODE_ID=ps.ID )
AND ps.NAME != 'Default Permission Scheme';
