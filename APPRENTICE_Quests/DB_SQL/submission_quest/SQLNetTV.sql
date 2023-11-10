--step3
--1
SELECT エピソード名, 視聴回数
FROM episodes
ORDER BY 視聴回数 DESC
LIMIT 3
;

--2

SELECT pro.番組名 AS 番組タイトル,
    epi.シーズン名 AS シーズン数,
    epi.エピソード番号 AS エピソード数,
    epi.エピソード名 AS エピソードタイトル,
    epi.視聴回数
FROM programs AS pro
INNER JOIN episodes AS epi
ON pro.エピソードID = epi.エピソードID
ORDER BY epi.視聴回数 DESC
LIMIT 5
;

--3
--本日を'2023-11-07'とする

SELECT chan.チャンネル名,
slo.日時_番組開始時刻 AS 放送開始時刻,
slo.日時_番組終了時刻 AS 放送終了時刻,
epi.シーズン名 AS シーズン数,
epi.エピソード番号 AS エピソード数,
epi.エピソード名 AS エピソードタイトル,
epi.エピソード詳細
FROM slots AS slo
INNER JOIN programs AS pro
ON slo.番組ID = pro.番組ID
INNER JOIN episodes AS epi
ON pro.エピソードID = epi.エピソードID
INNER JOIN channels_slots AS chanslo
ON slo.番組枠ID = chanslo.番組枠ID
INNER JOIN channels AS chan
ON chanslo.チャンネルID = chan.チャンネルID
WHERE slo.日時_番組開始時刻 BETWEEN '2023-11-07 00:00:00' AND '2023-11-07 23:59:59'
;

--4
--本日を'2023-11-07'とする
--特定のチャンネル名'NKK'とする

SELECT chan.チャンネル名,
slo.日時_番組開始時刻 AS 放送開始時刻,
slo.日時_番組終了時刻 AS 放送終了時刻,
epi.シーズン名 AS シーズン数,
epi.エピソード番号 AS エピソード数,
epi.エピソード名 AS エピソードタイトル,
epi.エピソード詳細
FROM slots AS slo
INNER JOIN programs AS pro
ON slo.番組ID = pro.番組ID
INNER JOIN episodes AS epi
ON pro.エピソードID = epi.エピソードID
INNER JOIN channels_slots AS chanslo
ON slo.番組枠ID = chanslo.番組枠ID
INNER JOIN channels AS chan
ON chanslo.チャンネルID = chan.チャンネルID
WHERE slo.日時_番組開始時刻 BETWEEN '2023-11-07 00:00:00' AND '2023-11-14 23:59:59'
AND chan.チャンネル名 = 'NKK'
;

--5
--本日を'2023-11-07'とする
SELECT
pro.番組名 AS 番組タイトル,
epi.視聴回数 AS 視聴数
FROM slots AS slo
INNER JOIN programs AS pro
ON slo.番組ID = pro.番組ID
INNER JOIN episodes AS epi
ON pro.エピソードID = epi.エピソードID
WHERE slo.日時_番組開始時刻 BETWEEN '2023-11-07 00:00:00' AND '2023-11-14 23:59:59'
ORDER BY epi.視聴回数 DESC
LIMIT 2
;



--6


ROUND(AVG(epi.視聴回数)) AS エピソード平均視聴回数

SELECT
pro.番組名
FROM programs AS pro
INNER JOIN episodes AS epi
ON pro.エピソードID = epi.エピソードID
INNER JOIN programs_genres AS pg
ON pg.番組ID = pro.番組ID
INNER JOIN genres AS gen
ON gen.ジャンルID = pg.ジャンルID
GROUP BY
pro.番組名
LIMIT 10
;