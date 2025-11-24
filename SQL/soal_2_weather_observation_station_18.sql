WITH agregasi AS (
    SELECT
        (MAX(lat_n)-MIN(lat_n)) + (MAX(long_w)-MIN(long_w)) as ag
    FROM station
)

SELECT 
    CAST(SQRT(ag * ag) as DECIMAL(10,4)) as distance
FROM agregasi;