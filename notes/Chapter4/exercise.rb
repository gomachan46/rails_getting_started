def string_shuffle(s)
  s.split('').shuffle.join
end

p string_shuffle 'hogefuga'

class String
  def shuffle
    self.split('').shuffle.join
  end
end


p "hogehoge".shuffle

person1 = { first: 'hoge', last: 'fuga' }
person2 = { first: 'foo', last: 'bar' }
person3 = { first: 'piyo', last: 'puyo' }

params = { father: person1, mother: person2, child: person3 }

p params[:father][:first]

hash = { a: 100, b: 200 }
p hash.merge({ b: 300 })
