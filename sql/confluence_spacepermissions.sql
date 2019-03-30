/******************************************************************
 * Author:        kurt
 * Email:         kurt@mobux.de
 * URL:           http://www.mobux.de
 * SQL File:      confluence_spacepermissions
 * Notes:         List all spacepermissions for a specific login
 *           	  (group based and individual permissions)
 ******************************************************************/

/* List group based permissions */
SELECT s.spacekey
FROM SPACEPERMISSIONS sp
JOIN SPACES s ON s.spaceid = sp.spaceid
JOIN cwd_group g ON sp.permgroupname = g.group_name
JOIN cwd_membership m ON g.id = m.parent_id
JOIN cwd_user u ON m.child_user_id = u.id
WHERE sp.permgroupname IN
    (
    SELECT g.group_name
    FROM cwd_group g
    JOIN cwd_membership m ON g.id = m.parent_id
    JOIN cwd_user u ON m.child_user_id = u.id
    WHERE u.user_name = '<USERNAME>'
    )
GROUP BY s.spacekey
ORDER BY s.spacekey;

/* List individual permissions */
SELECT s.spacenkey
FROM cwd_user u
JOIN user_mapping um  ON u.user_name=um.username
JOIN SPACEPERMISSIONS sp  ON um.user_key=sp.permusername
JOIN SPACES s  ON sp.spaceid=s.spaceid
WHERE u.user_name = "<USERNAMEuser_name>"
GROUP BY s.spacekey
ORDER BY s.spacekey;
