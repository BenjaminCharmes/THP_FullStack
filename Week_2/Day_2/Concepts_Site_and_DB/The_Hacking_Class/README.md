# Struture de la DBB:

| Table 1: | students |
| --- | --- |
| id | INTEGER PRIMARY KEY AUTOINCREMENT |
| course_id | INTEGER |
| name | TEXT |

| Table 2: | courses |
| --- | --- |
| id | INTEGER PRIMARY KEY AUTOINCREMENT |
| title | TEXT |
| description | TEXT |

| Table 3: | lessons |
| --- | --- |
| id | INTEGER PRIMARY KEY AUTOINCREMENT |
| course_id | INTEGER |
| title | TEXT |
| body | TEXT |