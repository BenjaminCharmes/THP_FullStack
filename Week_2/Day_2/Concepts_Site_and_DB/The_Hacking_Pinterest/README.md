# Struture de la DBB:

| Table 1: | users |
| --- | --- |
| id | INTEGER PRIMARY KEY AUTOINCREMENT |
| name | TEXT |

| Table 2: | pins |
| --- | --- |
| id | INTEGER PRIMARY KEY AUTOINCREMENT |
| user_id | INTEGER |
| url | TEXT |

| Table 3: | comments |
| --- | --- |
| id | INTEGER PRIMARY KEY AUTOINCREMENT |
| pin_id | INTEGER |
| comment | TEXT |