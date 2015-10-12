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
