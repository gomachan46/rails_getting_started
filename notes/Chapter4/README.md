# Rails風味のRuby

titleを各ページで与えなかった場合、`:title`が空になってしまい、`| Ruby on Rails Tutorial Sample App`というタイトルになってしまい微妙。

これをタイトルが空なときは余計な縦棒を追加しないようにしたい。

そのためにfull_titleというヘルパーを作成する。

# app/helpers/application_helper.rb

```ruby
module ApplicationHelper

  # ページごとの完全なタイトルを返す
  def full_title(page_title = '')
    base_title = "Ruby on Rails Tutorial Sample App"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
```

これをapplication.html.erbで使ってあげれば、page_titleとbase_titleをよしなにうまく利用したタイトルが出来上がるようになる

ぼちぼち要点だけメモるようにして、学習効率をあげよう

* ヘルパーを使ってviewでのちょっとした加工などを行おう(viewでのmodel的な)

# 文字列とメソッド

* 学習ツールとして素晴らしいrails console

# 他のデータ構造

## 配列

* `a << "foo" << "bar"        # 配列に連続して追加する` こんな記法も可能
