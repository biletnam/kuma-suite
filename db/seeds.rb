Department.create([
  {name: 'General'},
  {name: 'Customer Service'},
  {name: 'Tech Department'},
  {name: 'Business'},
  {name: 'Sales'},
  {name: 'Production'},
  {name: 'Administration'}
  ])
puts "Departments created!"

User.new(
  email: 'nic@gmail.com',
  password: 'qweqwe',
  password_confirmation: 'qweqwe'
)
puts "Nic created!"

User.new(
  email: 'admin@gmail.com',
  password: 'qweqwe',
  password_confirmation: 'qweqwe'
)
puts 'Admin created!'

# add first last name

20.times do
  User.create(email: Faker::Internet.safe_email,
              password: 'qweqwe',
              password_confirmation: 'qweqwe')
end
puts 'Users created!'


2.times do
  department = Department.all.sample
  user = User.all.sample
  # tags = Tag.all.sample(rand(1..4))
  Ticket.create(  title: Faker::Commerce.product_name,
                  body: Faker::Hipster.paragraph,
                  department_id: Department.id,
                  user_id: user.id
  )
end
puts 'Random tickets created'

puts '>>>>>>>>>>'
puts 'Seeding complete'
puts '<<<<<<<<<<'
