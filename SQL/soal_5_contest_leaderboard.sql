WITH max_score AS (
    SELECT
        hacker_id,
        challenge_id,
        MAX(score) AS max_score
    FROM submissions
    GROUP BY hacker_id, challenge_id
),
hacker_name AS (
    SELECT 
        h.hacker_id,
        h.name,
        ms.max_score
    FROM max_score ms 
    INNER JOIN hackers h ON ms.hacker_id = h.hacker_id
)

SELECT
    hacker_id,
    name,
    SUM(max_score) AS total_max_score
FROM hacker_name
GROUP BY hacker_id, name
HAVING SUM(max_score) > 0
ORDER BY total_max_score DESC, hacker_id ASC;