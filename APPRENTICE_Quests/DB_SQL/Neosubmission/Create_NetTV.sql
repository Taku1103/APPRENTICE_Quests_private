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
    番組枠再生数 INT DEFAULT 0,

    番組ID INT NOT NULL,
    エピソードID INT NOT NULL
);

-- 番組 (Programs) テーブル:
CREATE TABLE Programs (
    番組ID INT PRIMARY KEY AUTO_INCREMENT,
    番組名 VARCHAR(255) NOT NULL,
    総シーズン数 INT NOT NULL,
    総エピソード数 INT NOT NULL,
    番組詳細 TEXT,
    番組再生数 INT DEFAULT 0
);

-- エピソード (Episodes) テーブル:
CREATE TABLE Episodes (
    エピソードID INT PRIMARY KEY AUTO_INCREMENT,
    エピソード名 VARCHAR(255) NOT NULL,
    エピソード番号 VARCHAR(50) ,
    エピソード詳細 TEXT,
    シーズン名 VARCHAR(255),
    動画時間 TIME,
    公開日 DATE,
    エピソード再生数 INT DEFAULT 0,

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


-- 外部キー追加

ALTER TABLE Channels_Slots ADD(
    FOREIGN KEY fk_chanslo_chan(チャンネルID) REFERENCES Channels(チャンネルID),
    FOREIGN KEY fk_chanslo_slo(番組枠ID) REFERENCES Slots(番組枠ID));

ALTER TABLE Slots ADD(
    FOREIGN KEY fk_slo_pro(番組ID) REFERENCES Programs(番組ID),
    FOREIGN KEY fk_slo_epi(エピソードID) REFERENCES Episodes(エピソードID));

ALTER TABLE Programs_Genres ADD(
    FOREIGN KEY fk_progen_pro(番組ID) REFERENCES Programs(番組ID),
    FOREIGN KEY fk_progen_gen(ジャンルID) REFERENCES Genres(ジャンルID));

ALTER TABLE Episodes ADD
    FOREIGN KEY fk_epi_pro(番組ID) REFERENCES Programs(番組ID);