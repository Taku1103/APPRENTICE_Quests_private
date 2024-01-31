/* user */
INSERT INTO
  users (
    id_on_twitch,
    login_name,
    display_name,
    profile_image_url,
    user_created_at,
    created_at,
    updated_at
  )
VALUES
  (
    "testman_id_2",
    "testman_name_2",
    "dis_testman_name_2",
    "img.img2",
    "20240131",
    "2024-01-01 15:06:47.316723",
    "2024-01-01 15:06:47.316723"
  );

/* clips */
INSERT INTO
  clips (
    id_on_twitch,
    url,
    embed_url,
    broadcaster_id,
    broadcaster_name,
    creator_id,
    creator_name,
    video_id,
    game_id,
    language,
    title,
    view_count,
    clip_created_at,
    thumbnail_url,
    duration,
    vod_offset,
    is_featured,
    game_title,
    created_at,
    updated_at
  )
VALUES
  (
    '444444123456743534589',
    'https://www.twitch.tv/clip/abcdef',
    'https://clips.twitch.tv/embed/abcdef',
    '987654321',
    'broadcaster123',
    '555555555',
    'creator456',
    'v78901234',
    'game987',
    'en',
    'Awesome Clip Title',
    '10000',
    '2024-01-30 12:34:56',
    'https://example.com/thumbnail.jpg',
    30,
    60,
    false,
    'Exciting Game',
    '2024-01-30 12:34:56',
    '2024-01-30 12:34:56'
  );

playlist_clips
INSERT INTO
  playlist_clips (
    playlist_id,
    clip_id,
    order_index,
    created_at,
    updated_at
  )
VALUES
  (
    3,
    3,
    1,
    '2024-01-30 12:34:56',
    '2024-01-30 12:34:56'
  );