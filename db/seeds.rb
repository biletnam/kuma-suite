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

User.create(first_name: 'Nic',
            last_name: 'Tamura',
            email: 'nic@gmail.com',
            password: 'qweqwe',
            password_confirmation: 'qweqwe'
            )
puts "Nic created!"

User.create(first_name: 'Admin',
            last_name: 'Admin',
            email: 'admin@gmail.com',
            password: 'qweqwe',
            password_confirmation: 'qweqwe'
            )
puts 'Admin created!'

20.times do
  User.create(first_name: Faker::Name.first_name,
              last_name:  Faker::Name.last_name,
              email: Faker::Internet.safe_email,
              password: 'qweqwe',
              password_confirmation: 'qweqwe'
              )
end
puts 'Users created!'

10.times do
  department = Department.all.sample
  user = User.all.sample
  Ticket.create(title: Faker::Commerce.product_name,
                body: Faker::Hipster.paragraph,
                department_id: department.id,
                user_id: user.id
                )
end
puts 'Random tickets created'

puts '>>>>>> Seeding complete <<<<<<'
