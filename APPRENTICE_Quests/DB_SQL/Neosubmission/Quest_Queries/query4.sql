SELECT chan.チャンネル名,
    slo.日時_番組開始時刻 AS 放送開始時刻,
    slo.日時_番組終了時刻 AS 放送終了時刻,
    epi.シーズン名 AS シーズン数,
    epi.エピソード番号 AS エピソード数,
    epi.エピソード名 AS エピソードタイトル,
    epi.エピソード詳細
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
INNER JOIN
    channels_slots AS chanslo
ON
    slo.番組枠ID = chanslo.番組枠ID
INNER JOIN
    channels AS chan
ON
    chanslo.チャンネルID = chan.チャンネルID
WHERE
    slo.日時_番組開始時刻 BETWEEN '2023-11-07 00:00:00' AND '2023-11-14 23:59:59'
AND chan.チャンネル名 = 'NKK'
;