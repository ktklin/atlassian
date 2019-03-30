/******************************************************************
 * Author:        kurt
 * Email:         kurt@mobux.de
 * URL:           www.mobux.de
 * SQL File:      jira_unused_logins
 * Notes:         List all unused jira logins 
 *                that did not log in since the specifified
 *                LOGINDATE
 ******************************************************************/
 SELECT d.directory_name AS "Directory",
    u.user_name AS "Username",
    from_unixtime((cast(attribute_value AS UNSIGNED)/1000)) AS "Last Login"
FROM cwd_user u
JOIN (
    SELECT DISTINCT child_name
    FROM cwd_membership m
    JOIN licenserolesgroup gp ON m.parent_name = gp.GROUP_ID
    ) AS m ON m.child_name = u.user_name
JOIN (
    SELECT *
    FROM cwd_user_attributes
    WHERE attribute_name = 'login.lastLoginMillis'
    ) AS a ON a.user_id = u.id
JOIN cwd_directory d ON u.directory_id = d.id
WHERE from_unixtime((cast(attribute_value AS UNSIGNED)/1000)) < [LOGINDATE]
ORDER BY "Last Login" DESC;
