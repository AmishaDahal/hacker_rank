/*
========================================
Branch Total + % Contribution (Window Function)
========================================
Goal:
- Show each student row
- Add branch_total (sum of marks within the branch)
- Add branch_percentage = marks as % of branch_total

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

SELECT
  t.*,
  ROUND(t.marks * 100.0 / t.branch_total, 2) AS branch_percentage
FROM (
  SELECT
    s.*,
    SUM(s.marks) OVER (PARTITION BY s.branch) AS branch_total
  FROM student s
) t;
