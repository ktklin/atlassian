/******************************************************************
 * Author:        kurt
 * Email:         kurt@mobux.de
 * URL:           http://www.mobux.de
 * SQL File:      confluence_unused_spaces
 * Notes:         Find spaces that did NOT get modified since a
 *                specific date
 ******************************************************************/

SELECT spaces.spacename, spaces.spacekey
FROM content, spaces
WHERE content.spaceid = spaces.spaceid
GROUP BY spaces.spacename, spaces.spacekey
HAVING MAX(content.lastmoddate) < '<MODIFICATIONDATE>';
