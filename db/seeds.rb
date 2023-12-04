u1 = User.create(email: 'aa@aa.aa', password: 'aa@@aa.aa')
u2 = User.create(email: 'bb@aa.aa', password: 'bb@@aa.aa')

u1.products.create(title: 'ddd', description: 'ccc', price: '66666')

u1 = User.find_by(email: "xx@aaa.cc")

User.create(email: list)

list = ['aa@aa.aa', 'bb@bb.bb', 'cc@cc.cc']

  list.each do |email|
  user = user.find_by(email:)
  if not user
    User.create(email:, password: email)
  end

  list = [1,2,3,4,5]
  list.print

  x = 1
  while x <= 5
    puts x
    x += 1
  end

  (0..5).each do |x|
    puts x
  end

  1.upto(5) do |i|
    puts i
  end

  Faker::Internet.email

  user = User.find_or_create_by(email:) do |u|
    u.password = '123456'
  end

  5.times do
    email = Faker::internet.email
    user = User.find_by(email: email)
    if not User
      user.create(email: email, password: email)
    end
  end

  user = User.find_or_create_by(email:) do |u|
    u.password = '123456'
  end

  puts "使用者:#{user.email}"

10.times do
  product = user.products.create(
    title: Faker::Book.titke,
    description: Faker::Lorem.paragraph,
    price: rand(10..100)
  )
  puts "建立商品#{user.prodct}"
  end
end

puts "資料建立完成"
