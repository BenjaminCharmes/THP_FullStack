# Struture de la DBB:

| Table 1: | courses |
| --- | --- |
| id | INTEGER PRIMARY KEY AUTOINCREMENT |
| title | TEXT |
| description | TEXT |

| Table 2: | lessons |
| --- | --- |
| id | INTEGER PRIMARY KEY AUTOINCREMENT |
| course_id | INTEGER |
| title | TEXT |
| body | TEXT |