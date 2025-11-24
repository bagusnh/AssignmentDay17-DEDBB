WITH student_grade AS (
    SELECT 
        s.name,
        g.grade,
        s.marks
    FROM students s 
    INNER JOIN grades g ON s.marks BETWEEN g.min_mark AND g.max_mark
)

SELECT
    CASE
        WHEN grade < 8 THEN NULL
        ELSE name
    END,
    grade,
    marks
FROM student_grade
ORDER BY grade DESC, name ASC, marks ASC;