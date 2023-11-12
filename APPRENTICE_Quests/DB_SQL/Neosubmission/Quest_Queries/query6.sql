WITH GenreAvg AS (
    SELECT
        gen.ジャンル名,
        pro.番組名,
        ROUND(AVG(epi.エピソード再生数)) AS エピソード平均視聴回数
    FROM
        programs AS pro
    INNER JOIN
        episodes AS epi
        ON epi.番組ID = pro.番組ID
    INNER JOIN
        programs_genres AS pg
        ON pg.番組ID = pro.番組ID
    INNER JOIN
        genres AS gen
        ON gen.ジャンルID = pg.ジャンルID
    GROUP BY
        gen.ジャンル名,
        pro.番組名
)
SELECT
    ga.ジャンル名,
    ga.番組名,
    ga.エピソード平均視聴回数
FROM
    GenreAvg AS ga
INNER JOIN (
    SELECT
        ジャンル名,
        MAX(エピソード平均視聴回数) AS 最大視聴回数
    FROM
        GenreAvg
    GROUP BY
        ジャンル名) AS MaxView
ON ga.ジャンル名 = MaxView.ジャンル名 AND ga.エピソード平均視聴回数 = MaxView.最大視聴回数
;
