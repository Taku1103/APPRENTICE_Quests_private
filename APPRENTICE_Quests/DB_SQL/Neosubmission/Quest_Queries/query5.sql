SELECT
    pro.番組名 AS 番組タイトル,
    SUM(epi.エピソード再生数) AS 週間エピソード視聴合計数
FROM
    slots AS slo
INNER JOIN
    programs AS pro
ON
    slo.番組ID = pro.番組ID
INNER JOIN
    episodes AS epi
ON
    slo.エピソードID = epi.エピソードID
WHERE
    slo.日時_番組開始時刻 BETWEEN (NOW() - INTERVAL 1 WEEK) AND NOW()
GROUP BY
    pro.番組名
ORDER BY
    週間エピソード視聴合計数 DESC
LIMIT 2
;
