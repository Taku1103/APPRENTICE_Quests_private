-- チャンネル (Channels) テーブル:
CREATE TABLE Channels (
    チャンネルID INT PRIMARY KEY AUTO_INCREMENT,
    チャンネル名 VARCHAR(100) NOT NULL,
    チャンネル概要 TEXT
);


-- チャンネルと番組枠の関連付けを行うテーブル (Channels_Slots):
CREATE TABLE Channels_Slots (
    チャンネルID INT NOT NULL,
    番組枠ID INT NOT NULL,
    PRIMARY KEY (チャンネルID, 番組枠ID)
);

-- 番組枠 (Slots) テーブル:
CREATE TABLE Slots (
    番組枠ID INT PRIMARY KEY AUTO_INCREMENT,
    日時_番組開始時刻 DATETIME NOT NULL,
    日時_番組終了時刻 DATETIME NOT NULL,
    番組ID INT NOT NULL
);

-- 番組 (Programs) テーブル:
CREATE TABLE Programs (
    番組ID INT PRIMARY KEY AUTO_INCREMENT,
    番組名 VARCHAR(255) NOT NULL,
    総シーズン数 INT NOT NULL,
    総エピソード数 INT NOT NULL,
    番組詳細 TEXT,
    番組再生数 INT,
    エピソードID INT NOT NULL
);

-- エピソード (Episodes) テーブル:
CREATE TABLE Episodes (
    エピソードID INT PRIMARY KEY AUTO_INCREMENT,
    エピソード名 VARCHAR(255) NOT NULL,
    エピソード番号 VARCHAR(50),
    エピソード詳細 TEXT,
    シーズン名 VARCHAR(255),
    視聴数 INT,
    動画時間 TIME,
    公開日 DATE,
    視聴回数 INT,
    番組ID INT NOT NULL
);


-- 番組とジャンルの関連付けを行うテーブル (Programs_Genres):
CREATE TABLE Programs_Genres (
    番組ID INT NOT NULL,
    ジャンルID INT NOT NULL,
    PRIMARY KEY (番組ID, ジャンルID)
);

-- ジャンル (Genres) テーブル:
CREATE TABLE Genres (
    ジャンルID INT PRIMARY KEY AUTO_INCREMENT,
    ジャンル名 VARCHAR(100)
);


/* 外部キー追加 */

ALTER TABLE Channels_Slots ADD
    (FOREIGN KEY fk_channels(チャンネルID) REFERENCES Channels(チャンネルID),
    FOREIGN KEY fk_slots(番組枠ID) REFERENCES Slots(番組枠ID));

ALTER TABLE Slots ADD
    FOREIGN KEY fk_programs(番組ID) REFERENCES Programs(番組ID);

ALTER TABLE Programs ADD
    FOREIGN KEY fk_episodes(エピソードID) REFERENCES Episodes(エピソードID);

ALTER TABLE Episodes ADD
    FOREIGN KEY fk_programs(番組ID) REFERENCES Programs(番組ID);

ALTER TABLE Programs_Genres ADD(
    FOREIGN KEY (番組ID) REFERENCES Programs(番組ID),
    FOREIGN KEY (ジャンルID) REFERENCES Genres(ジャンルID));



----insert
-- Channels テーブルにサンプルデータを挿入
INSERT INTO Channels (チャンネル名, チャンネル概要)
VALUES
    ('NHK総合', 'NHK総合の説明'),
    ('日本テレビ', '日本テレビの説明'),
    ('テレビ朝日', 'テレビ朝日の説明'),
    ('TBS', 'TBSの説明'),
    ('フジテレビ', 'フジテレビの説明'),
    ('テレビ東京', 'テレビ東京の説明'),
    ('BS11', 'BS11の説明'),
    ('WOWOW', 'WOWOWの説明'),
    ('BS日テレ', 'BS日テレの説明'),
    ('BS朝日', 'BS朝日の説明');

-- Slots テーブルにサンプルデータを挿入
INSERT INTO Slots (日時_番組開始時刻, 日時_番組終了時刻, 番組ID)
VALUES
    ('2023-11-07 08:00:00', '2023-11-07 09:00:00', 1),
    ('2023-11-07 10:30:00', '2023-11-07 11:30:00', 2)
    ;

-- Programs テーブルにサンプルデータを挿入
INSERT INTO Programs (番組名, 総シーズン数, 総エピソード数, 番組詳細, 番組再生数, エピソードID)
VALUES
    ('鬼滅の刃', 1, 26, '鬼滅の刃の詳細', 100000, 1),
    ('サッカー代表戦', 1, 1, 'サッカー代表戦の詳細', 50000, 2),
    ('ドラマA', 2, 20, 'ドラマAの詳細', 80000, 3),
    ('映画B', 1, 1, '映画Bの詳細', 30000, 4)
    ;

-- Episodes テーブルにサンプルデータを挿入
INSERT INTO Episodes (エピソード名, エピソード番号, エピソード詳細, シーズン名, 視聴数, 動画時間, 公開日, 視聴回数, 番組ID)
VALUES
    ('鬼滅の刃 エピソード1', '第1話', '鬼滅の刃 エピソード1の詳細', 'シーズン1', 50000, '00:24:00', '2023-11-07', 20000, 1),
    ('日本vsイタリア', '決勝戦', '日本vsイタリアの詳細', 'シーズン1', 30000, '02:00:00', '2023-11-08', 15000, 2),
    ('ドラマA エピソード1', '第1話', 'ドラマA エピソード1の詳細', 'シーズン1', 45000, '00:45:00', '2023-11-09', 18000, 3),
    ('映画B', NULL, '映画Bの詳細', NULL, 25000, '01:30:00', '2023-11-10', 12000, 4),
    -- 他のエピソードデータを続けて挿入
    ;

-- Genres テーブルにサンプルデータを挿入
INSERT INTO Genres (ジャンル名)
VALUES
    ('アクション'),
    ('スポーツ'),
    ('ドラマ'),
    ('コメディ'),
    ('アニメ'),
    ('映画'),
    ('ニュース'),
    ('音楽'),
    ('バラエティ'),
    ('教育'),
    ('ドキュメンタリー'),
    ('ホラー'),
    ('SF'),
    ('ファンタジー'),
    ('冒険'),
    ('ロマンス'),
    ('歴史'),
    ('西部劇'),
    ('スパイ'),
    ('ミステリー');

-- Programs_Genres テーブルにサンプルデータを挿入
INSERT INTO Programs_Genres (番組ID, ジャンルID)
VALUES
    (1, 1),  -- 鬼滅の刃はアクションジャンル
    (2, 2),  -- サッカー代表戦はスポーツジャンル
    (3, 3),  -- ドラマAはドラマジャンル
    (4, 6),  -- 映画Bは映画ジャンル
    -- 他の番組とジャンルの関連データを続けて挿入
    ;