# RailsはMVC

はい。`app/` に軒並みある

# hello world

```ruby
def hello
    render text: "hello, world!"
  end
```

`hello, world!` と画面に表示するサンプル

## ルートに設定

`config/routes.rb` で指定する

```ruby
root 'application#hello'
```

applicationコントローラーのhelloメソッドを登録する感じ

これで`/`にアクセスした時にはhelloアクションが呼ばれる

# Gitの話

スルー

# Herokuの話

うーん、ここはいいや

# 演習

```
リスト1.8のhelloアクションを書き換え、「Hello, world!」の代わりに「hola, mundo!」と表示されるようにしてみましょう。
課外作業: Railsの表示では「非ASCII文字」もサポートされています。スペイン語特有の逆さ感嘆符「¡」を含む「¡Hola, mundo!」を表示してみましょう (図1.19)20。

リスト1.8のhelloアクションを複製して、第2のアクションgoodbyeを追加しましょう。
このアクションは、「goodbye, world!」というテキストを表示します。
リスト1.10のルーティングを編集して、ルートルーティングの割り当て先をhelloアクションからgoodbyeアクションに変更します (図1.20)。
```
