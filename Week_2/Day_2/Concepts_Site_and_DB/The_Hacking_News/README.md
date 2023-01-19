# Struture de la DBB:

| Table 1: | users |
| --- | --- |
| id | INTEGER PRIMARY KEY AUTOINCREMENT |
| name | TEXT |

| Table 2: | links |
| --- | --- |
| id | INTEGER PRIMARY KEY AUTOINCREMENT |
| user_id | INTEGER |
| link | TEXT |

| Table 3: | comments |
| --- | --- |
| id | INTEGER PRIMARY KEY AUTOINCREMENT |
| link_id | INTEGER |
| comment | TEXT |

| Table 4: | comments_comments |
| --- | --- |
| id | INTEGER PRIMARY KEY AUTOINCREMENT |
| comment_id | INTEGER |
| comment | TEXT |