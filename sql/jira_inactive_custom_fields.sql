/**********************************************************************
 * SQL FILE: jira_inactive_notification_schemes
 * Author:   Kurt Klinner
 * Email:    kurt@mobux.de
 * URL:      https://mobux.de
 * Date:     Sat Mar 30 23:57:46 2019
 *
 * Notes:    List custom fields that are unused
 **********************************************************************/
SELECT customfield.id
FROM customfield LEFT JOIN customfieldvalue ON customfield.id = customfieldvalue.customfield
WHERE customfieldvalue.stringvalue IS NULL
AND customfieldvalue.numbervalue IS NULL
AND customfieldvalue.textvalue IS NULL
ORDER BY customfield.id
