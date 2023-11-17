JavaScript について説明できる
1. JavaScript とは
JavaScript とは何か、HTML/CSS とはどのような関係にあるのか、プログラミング初心者にわかるように説明してください。

JavaScript は、ウェブサイトに対話性を追加するプログラミング言語です。
ゲーム、ボタンを押したときの反応、フォームへのデータ入力、動的なスタイル付け、アニメーションなどがこれにあたります

2. ECMAScript とは
ECMAScript とは何か、プログラミング初心者にわかるように説明してください。

ECMAScript（エクマスクリプト）は、Ecma Internationalもとで標準化されたJavaScriptの規格である

なお、学習する際には ECMAScript 2015（ES2015）以降のバージョンを学習してください。

3. 環境構築
JavaScript のコードを実行できるように環境を構築してください。

JavaScript の実行方法はいくつかあります。

ブラウザの開発者ツールのコンソールで実行する
ファイルを作成し、ブラウザで開く
Node.js をインストールし、コマンドラインで実行する
そのうち、本学習においては2を推奨します。1はちょっとした処理を実行するには便利ですが、書いたコードが手元に残らないため、復習しづらくなります。3は、Node.js のインストールが必要になるため、環境構築が面倒になります。2が一番手軽で、コードも手元に残り復習しやすいです。

以下、2の方法で環境構築を行います。

まず、任意のディレクトリに hello.html というファイルを作成してください。ファイル名は何でも構いません。学習トピックごとにファイルをわけ、トピックに関する名前をつけると復習しやすくなります。

<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>JavaScript学習</title>
</head>

<body>
  <script src="hello.js"></script>
</body>

</html>
次に、hello.js というファイルを作成してください。ファイル名は何でも構いません。

console.log('Hello World');
最後に、hello.html をブラウザで開いてください。ブラウザの開発者ツールのコンソールに Hello World と表示されれば成功です。

なお、Visual Studio Code を使用されている場合は、Live Server という拡張機能をインストールすると、ファイルを保存すると自動的にブラウザが更新されるため、便利です。