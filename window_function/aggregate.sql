/*
========================================
Example: Students above Branch Average
========================================

Input table: students
+---------+--------+-------+
| student | branch | marks |
+---------+--------+-------+
| A       | CS     | 80    |
| B       | CS     | 70    |
| C       | CS     | 90    |
| D       | CE     | 60    |
| E       | CE     | 75    |
+---------+--------+-------+

*/

SELECT *
FROM (
  SELECT
    *,
    AVG(marks) OVER (PARTITION BY branch) AS branch_avg
  FROM student
) t
WHERE t.marks > t.branch_avg;

/*
Notes:
- GROUP BY would return 1 row per branch.
- Window function keeps all rows and adds branch_avg to each student row.
*/
