/******************************************************************
 * Author:        kurt
 * Email:         kurt@mobux.de
 * URL:           http://www.mobux.de
 * SQL File:      confluence_findpageforattachement
 * Notes:         Find the confluence page a specific attachment
 *                belongs to
 ******************************************************************/

SELECT s.spacename, c.contentid,  c.title, c.contenttype
FROM CONTENT c inner JOIN SPACES s
ON c.spaceid = s.spaceid
WHERE c.contentid IN (SELECT contentid
                      FROM BODYCONTENT
                      WHERE prevver IS NULL
                      AND body LIKE '%filename="FILENAME%');
