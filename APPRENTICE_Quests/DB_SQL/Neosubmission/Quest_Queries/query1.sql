SELECT
    エピソード名 AS エピソードタイトル,
    エピソード再生数 AS 視聴数
FROM
    episodes
ORDER BY
    エピソード再生数 DESC
LIMIT 3
;