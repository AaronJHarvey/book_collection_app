
3.times do
  user = User.create(name: Faker::FunnyName.name, email: Faker::Internet.email)
  3.times do
    user.books.create(title: Faker::Book.title, author:Faker::Book.author)
  end
end
