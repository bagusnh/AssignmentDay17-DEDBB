WITH max_score_challenge AS (
    SELECT 
        c.challenge_id,
        MAX(d.score) AS max_score_challenge
    FROM challenges c 
    LEFT JOIN difficulty d ON d.difficulty_level = c.difficulty_level
    GROUP BY c.challenge_id
),
count_score_hacker AS (
    SELECT
        s.hacker_id,
        COUNT(*) AS count_score_hacker
    FROM submissions s 
    LEFT JOIN max_score_challenge msc ON s.challenge_id = msc.challenge_id
    WHERE s.score = msc.max_score_challenge
    GROUP BY s.hacker_id
    HAVING COUNT(*) > 1
),
hacker_name AS (
    SELECT
        h.hacker_id,
        h.name,
        csh.count_score_hacker
    FROM hackers h
    INNER JOIN count_score_hacker csh ON h.hacker_id = csh.hacker_id
)

SELECT 
    hacker_id,
    name
FROM hacker_name
ORDER BY count_score_hacker DESC, hacker_id ASC;