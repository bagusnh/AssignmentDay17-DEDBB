WITH min_coin AS (
    SELECT 
        w.id,
        wp.age,
        MIN(w.coins_needed) OVER(PARTITION BY w.power, wp.age) AS min_coin
    FROM wands w
    LEFT JOIN wands_property wp ON w.code = wp.code
    WHERE wp.is_evil = 0
)

SELECT 
    w.id,
    mc.age,
    w.coins_needed,
    w.power
FROM wands w 
INNER JOIN min_coin mc 
ON w.id = mc.id
AND w.coins_needed = mc.min_coin
ORDER BY w.power DESC, mc.age DESC;