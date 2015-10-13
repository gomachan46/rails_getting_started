# Toyアプリケーション

一歩目として、おもちゃアプリケーションを作って学んでいく

# テーブル構成

![usersテーブル](./users.png)

![micropostsテーブル](./microposts.png)

# scaffoldの生成

# users

scaffoldコマンドの引数には、リソース名を単数形にしたもの (この場合はUser) を使用し、
必要に応じてデータモデルの属性をオプションとしてパラメータに追加する。

```
rails generate scaffold User name:string email:string
```

これだけで色々と自動生成され、一通りのCRUDができるようになる

![usersのscaffold](./users-scaffold.png)

# MVCの挙動

このあたりはわかるので画像だけ。

![rails-mvc](rails-mvc.png)

# config/routes.rb
 
```ruby
Rails.application.routes.draw do
  resources :users
  root 'users#index'
  ...
``` 

と変えてあげればさっき作成した`/users`がrootになる

# controllerに実装されたメソッドを見てみる

RESTアーキテクチャを構成している

![rails-rest](./rails-rest.png)

# scaffoldで作られたコードの問題点

scaffoldで作成したUsersリソースは、Railsの概要を手っ取り早く説明するには良いのですが、以下のようなさまざまな問題点を抱えています。

* データの検証が行われていない。
  * このままでは、ユーザー名が空欄であったり、でたらめなメールアドレスを入力したりしても通ってしまいます。
* ユーザー認証が行われていない。
  * ログイン、ログアウトが行われていないので、誰でも無制限に操作できてしまいます。
* テストが書かれていない。
  * 厳密にはこれは正しい表現ではありません。というのも、scaffoldで生成したコードにはごく簡単なテストが一応含まれているからです。ただ、scaffoldのテストコードはデータ検証やユーザー認証、その他の必要な要求を満たしていません。
* レイアウトやスタイルが整っていない。
  * サイトデザインも操作法も一貫していません。
* 理解が困難。
  * scaffoldのコードを理解できるぐらいなら、そもそも本書を読む必要はないでしょう。
  
こういったあたりをこの後埋めていくのかな

# Microposts リソース

次はmicroposts周りを進めていく。

まずはgenerateから

```
rails generate scaffold Micropost content:text user_id:integer
```

```
bundle exec rake db:migrate
```

# Micropostsを文字通りマイクロにする

文字数制限を行うために、validationを行っていく。

## app/models/micropost.rb

```ruby
class Micropost < ActiveRecord::Base
  validates :content, length: { maximum: 140 }
end
```

Railsのバリデーションはこういう風に書ける

もろもろは http://railsguides.jp/active_record_validations.html のあたりをみればよさそう

# ユーザーとマイクロポストをhas_manyで関連付ける

リレーションをRailsでは次のように表せる

詳しくは http://railsguides.jp/association_basics.html このあたり参照

## app/models/user.rb

```ruby
class User < ActiveRecord::Base
  has_many :microposts
end
```

## app/models/micropost.rb

```ruby
class Micropost < ActiveRecord::Base
  belongs_to :user
  validates :content, length: { maximum: 140 }
end
```

# rails console

Railsアプリケーションを対話的に操作することが可能な便利ツール

irbが立ち上がっていい感じに扱える

# 継承の階層

![model-inheritance](./model-inheritance.png)

![controller-inheritance](./controller-inheritance.png)

# 2章のまとめ

## 良い点

* Rails全体を高度なレベルで概観できた
* MVCモデルを紹介できた
* RESTアーキテクチャに初めて触れた
* データモデルの作成を初めて行った
* データベースを背後に持つWebアプリケーションを本番環境で動かした

## 課題

* レイアウトもスタイルも設定されていない
* “Home” や “About” のような定番の静的なページがない
* ユーザーがパスワードを設定できない
* ユーザーが画像を置けない
* ログインのしくみがない
* セキュリティのためのしくみがまったくない
* ユーザーとマイクロポストの自動関連付けが行われていない
* Twitterのような「フォロワー (following)機能」や「フォロー中 (followed)機能」がない
* マイクロポストをフィードできない
* まともなテストがない
* 理解が困難


今後は、これらの課題をひとつずつ潰していく流れになるっぽい

## まとめ

* Scaffold機能でコードを自動生成すると、Webのあらゆる部分からモデルデータにアクセスしてやりとりできるようになる。
* Scaffoldは何よりも手っ取り早いのがとりえだが、これを元にRailsを理解するには向いていない。
* RailsではWebアプリケーションの構成にMVC (Model-View-Controller) というモデルを採用している。
* Railsが解釈するRESTには、標準的なURLセットと、データモデルとやりとりするためのコントローラアクションが含まれている。
* Railsではデータのバリデーション (validation) がサポートされており、データモデルの属性の値に制限をかけることができる。
* Railsには、さまざまなデータモデル同士を関連付けを定義するための組み込み関数が多数用意されている。
* Railsコンソールを使用すると、コマンドラインからRailsアプリケーションとやりとりすることができる。
