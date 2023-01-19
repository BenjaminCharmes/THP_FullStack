# Struture de la DBB:

| Table 1: | users |
| --- | --- |
| id | INTEGER PRIMARY KEY AUTOINCREMENT |
| name | TEXT |

| Table 2: | article |
| --- | --- |
| id | INTEGER PRIMARY KEY AUTOINCREMENT |
| user_id | INTEGER |
| category_id | INTEGER |

| Table 3: | category |
| --- | --- |
| id | INTEGER PRIMARY KEY AUTOINCREMENT |
| article_id | INTEGER |
| title | TEXT |

| Table 4: | tag |
| --- | --- |
| id | INTEGER PRIMARY KEY AUTOINCREMENT |
| category_id | INTEGER |
| title | TEXT |
| color | TEXT |