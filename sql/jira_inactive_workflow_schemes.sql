/**********************************************************************
 * SQL FILE: jira_inactive_notification_schemes
 * Author:   Kurt Klinner
 * Email:    kurt@mobux.de
 * URL:      https://mobux.de
 * Date:     Sat Mar 30 23:57:46 2019
 *
 * Notes:    List workflow schemes that are not assigned to projects
 **********************************************************************/

SELECT wfs.NAME
FROM workflowscheme wfs
WHERE name NOT IN (SELECT wfs.NAME
                   FROM project p, nodeassociation na, workflowscheme wfs
                   WHERE na.source_node_entity='Project'
                   AND na.sink_node_entity='WorkflowScheme'
                   AND na.association_type='ProjectScheme'
                   AND na.SOURCE_NODE_ID=p.ID
                   AND na.SINK_NODE_ID=wfs.ID)
