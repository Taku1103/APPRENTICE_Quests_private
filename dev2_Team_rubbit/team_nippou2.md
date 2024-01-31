# 【チーム内_日報_2】
日付:2023/1/30(火)
筆記者:義積拓野
## 今日やったこと
- マイグレーションのRailsバグ?修正
- ルーティング整理の確認
- playlist_controllerの完成
- clips_controllerの完成
- 中間テーブル利用のデータの取得
- playlist_clips_controllerの基本挙動の完成

## 次やること
- APIのクエリパラメータ、リクエストボディ、レスポンスボディをしっかり書いて共有
- 全員で一貫したテストデータ
- modelのバリデーション
- 細かいアクションの挙動

## 共有事項
- playlist_controller、clips_controller、playlist_clips_controllerを使ったAPIはpostmanでテスト確認したのでfetchで叩ける状態です。(DBデータは共有されないので現状各人でサンプルデータを作成する必要があります)
- rails/routesで色々とrouteがありますがまた最低限のルーティングに整理します
- テーブルのカラムも少しタイポがありましたでドキュメント変更しています
- APIのreq,resボディを整理して共有します。
- みんなで使える共有のテストデータを作成するつもりです。
