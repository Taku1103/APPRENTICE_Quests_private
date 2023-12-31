# API を設計できる

## 1. API の設計項目

API を設計する際には多くの場合、以下の項目を考慮する必要があります。

- リクエストライン（HTTP リクエスト）
- リクエストヘッダー
- クエリパラメータ（リクエストのパラメータ）
- リクエストボディ
- レスポンス
- エラーレスポンス

そのことを念頭に置いた上で、有名な API がどのように設計されているのかを調べてみてください。

[LINE Messaging API](https://developers.line.biz/ja/reference/messaging-api/) や [Google YouTube Data API](https://developers.google.com/youtube/v3/docs?hl=ja) などが参考になります。

## 2. API の設計

TODO アプリ API の各エンドポイントに対して、API 設計をドキュメントにまとめてください。

具体的には、各エンドポイントに対して、以下の項目を記載してください。足りない項目があれば必要に応じて足してください。

- リクエストライン（HTTP リクエスト）
- リクエストボディ
- リクエストの例
- レスポンス
- レスポンスの例
- エラーレスポンス
- エラーレスポンスの例

ドキュメントにまとめる際は、1 で見た有名な API の書き方を真似してください。





リソースタイプ
Todos
Todos リソースはユーザーが登録したTodoが含まれます

このリソースの詳細については、リソース表現およびプロパティ一覧をご覧ください。

メソッド	HTTP リクエスト	説明
http://localhost:3000 からの相対 URI

リクエストライン:index	GET api/todos
リクエストボディ:なし

レスポンスボディ:JSON形式でtodo一覧

レスポンス例
{
    "status": "success",
    "todos": [
        {
            "id": 11,
            "title": null,
            "created_at": "2023-12-28T01:43:10.102Z",
            "updated_at": "2023-12-28T02:18:54.322Z"
        },
        {
            "id": 12,
            "title": "ああ",
            "created_at": "2023-12-28T01:43:17.880Z",
            "updated_at": "2023-12-28T01:43:17.880Z"
        },
        {
            "id": 17,
            "title": "aa",
            "created_at": "2023-12-28T02:18:55.513Z",
            "updated_at": "2023-12-28T02:18:55.513Z"
        },
        {
            "id": 18,
            "title": "tessss",
            "created_at": "2023-12-28T02:19:18.051Z",
            "updated_at": "2023-12-28T02:19:18.051Z"
        }
    ]
}
エラーレスポンス


リクエストライン:create	POST api/todos
リクエストボディ:JSON形式 新しいtodo情報
リクエスト例：
{
  "todo": {
    "title": "本を買う"
  }
}

レスポンスボディ:JSON形式 新規作成されたtodo
レスポンス例：
{
    "todo": {
        "id": 19,
        "title": "本を買う",
        "created_at": "2023-12-28T02:27:54.572Z",
        "updated_at": "2023-12-28T02:27:54.572Z"
    }
}

リクエストライン:update PATCH api/todos/:id
リクエストボディ:JSON形式 更新するtodo情報
リクエスト例
{
  "todo": {
    "title": "本を買わない"
  }
}

レスポンスボディ:JSON形式 更新されたtodo
レスポンス例：
{
  "todo": {
    "title": "本を買わない"
  }
}



リクエストライン:destroy DELETE api/todos/:id
リクエストボディ:JSON形式 削除されるtodo情報
リクエスト例
{
  "todo": {
    "title": "本を買わない"
  }
}

レスポンスボディ:なし
