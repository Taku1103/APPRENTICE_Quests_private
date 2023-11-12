SELECT
    pro.番組名 AS 番組タイトル,
    epi.シーズン名 AS シーズン数,
    epi.エピソード番号 AS エピソード数,
    epi.エピソード名 AS エピソードタイトル,
    epi.エピソード再生数 AS 視聴数
FROM
    episodes AS epi
INNER JOIN
    programs AS pro
ON
    epi.番組ID = pro.番組ID
ORDER BY
    epi.エピソード再生数 DESC
LIMIT 3
;