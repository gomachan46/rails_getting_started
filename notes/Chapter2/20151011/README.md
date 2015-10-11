# Toyアプリケーション

一歩目として、おもちゃアプリケーションを作って学んでいく

# テーブル構成

[usersテーブル](./users.png)

[micropostsテーブル](./microposts.png)

# scaffoldの生成

# users

scaffoldコマンドの引数には、リソース名を単数形にしたもの (この場合はUser) を使用し、
必要に応じてデータモデルの属性をオプションとしてパラメータに追加する。

```
rails generate scaffold User name:string email:string
```

これだけで色々と自動生成され、一通りのCRUDができるようになる

[usersのscaffold](./users-scaffold.png)

# MVCの挙動

このあたりはわかるので画像だけ。

[rails-mvc](rails-mvc.png)
