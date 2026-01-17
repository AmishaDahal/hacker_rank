/*
===========================================================
RANK() vs DENSE_RANK() using Window Functions (SQL)
===========================================================

Goal:
- Assign ranks to students within each branch based on marks (highest first)
- Compare how RANK() and DENSE_RANK() behave when there are ties

Key Idea:
- RANK(): ties share the same rank, but the next rank is SKIPPED (gap created)
- DENSE_RANK(): ties share the same rank, and the next rank is NOT skipped (no gap)

Example (Marks in one branch):
Marks: 95, 90, 90, 80
RANK():       1, 2, 2, 4   <-- gap (skips 3)
DENSE_RANK(): 1, 2, 2, 3   <-- no gap

-----------------------------------------------------------
Sample Input Table: student
+------------+--------------+--------+-------+
| student_id | student_name | branch | marks |
+------------+--------------+--------+-------+
| 1          | Aarav        | CS     | 95    |
| 2          | Bina         | CS     | 90    |
| 3          | Chirag       | CS     | 90    |
| 4          | Deepa        | CS     | 80    |
| 5          | Esha         | CE     | 92    |
| 6          | Farhan       | CE     | 92    |
| 7          | Gita         | CE     | 85    |
+------------+--------------+--------+-------+

Expected Output (conceptually):
+------------+--------------+--------+-------+-----------+------------+
| student_id | student_name | branch | marks | rank_std  | dense_rank |
+------------+--------------+--------+-------+-----------+------------+
| 1          | Aarav        | CS     | 95    | 1         | 1          |
| 2          | Bina         | CS     | 90    | 2         | 2          |
| 3          | Chirag       | CS     | 90    | 2         | 2          |
| 4          | Deepa        | CS     | 80    | 4         | 3          |
| 5          | Esha         | CE     | 92    | 1         | 1          |
| 6          | Farhan       | CE     | 92    | 1         | 1          |
| 7          | Gita         | CE     | 85    | 3         | 2          |
+------------+--------------+--------+-------+-----------+------------+

-----------------------------------------------------------
Query:
*/

SELECT
  s.*,
  RANK() OVER (PARTITION BY branch ORDER BY marks DESC)       AS rank_std,
  DENSE_RANK() OVER (PARTITION BY branch ORDER BY marks DESC) AS dense_rank
FROM student s
ORDER BY branch, marks DESC;
