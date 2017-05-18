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

a = User.new( first_name: 'Admin',
              last_name: 'Powers',
              email: 'admin@helpdesk.com',
              password: 'qweqwe',
              password_confirmation: 'qweqwe',
              is_admin: 'true',
              is_staff: 'true',
              is_client: 'false'
              )
  img = Avatarly.generate_avatar("#{a.first_name} #{a.last_name}", opts={size: 100})
  File.open("public/avatars/#{a.first_name}_#{a.last_name}.png", 'wb') do |f|
    f.write img
  end
  a.profile_pic = "#{a.first_name}_#{a.last_name}.png"
  a.save
puts 'Admin created!'


n = User.new(first_name: 'Nic',
             last_name: 'Tamura',
             email: 'nic@helpdesk.com',
             password: 'qweqwe',
             password_confirmation: 'qweqwe',
             is_admin: 'false',
             is_staff: 'true',
             is_client: 'false'
             )
  img = Avatarly.generate_avatar("#{n.first_name} #{n.last_name}", opts={size: 100})
  File.open("public/avatars/#{n.first_name}_#{n.last_name}.png", 'wb') do |f|
    f.write img
  end
  n.profile_pic = "#{n.first_name}_#{n.last_name}.png"
  n.save
puts "Nic created!"

20.times do
  u = User.new(first_name: Faker::Name.first_name,
               last_name:  Faker::Name.last_name,
               company: Faker::Company.name,
               email: Faker::Internet.safe_email,
               password: 'qweqwe',
               password_confirmation: 'qweqwe',
               is_admin: 'false',
               is_staff: 'true',
               is_client: 'false'
               )
  img = Avatarly.generate_avatar("#{u.first_name} #{u.last_name}", opts={size: 100})
  File.open("public/avatars/#{u.first_name}_#{u.last_name}.png", 'wb') do |f|
    f.write img
  end
  u.profile_pic = "#{u.first_name}_#{u.last_name}.png"
  u.save
end
puts 'Staffbase created!'

u = User.new(first_name: 'Client',
             last_name: 'Clientski',
             email: 'client@gmail.com',
             password: 'qweqwe',
             password_confirmation: 'qweqwe',
             is_admin: 'false',
             is_staff: 'false',
             is_client: 'true'
             )
  img = Avatarly.generate_avatar("#{u.first_name} #{u.last_name}", opts={size: 100})
  File.open("public/avatars/#{u.first_name}_#{u.last_name}.png", 'wb') do |f|
    f.write img
  end
  u.profile_pic = "#{u.first_name}_#{u.last_name}.png"
  u.save
puts 'Client created!'

20.times do
  u = User.new(first_name: Faker::Name.first_name,
               last_name:  Faker::Name.last_name,
               company:  Faker::Company.name,
               email: Faker::Internet.email,
               password: 'qweqwe',
               password_confirmation: 'qweqwe',
               is_admin: 'false',
               is_staff: 'false',
               is_client: 'true'
               )
  img = Avatarly.generate_avatar("#{u.first_name} #{u.last_name}", opts={size: 100})
  File.open("public/avatars/#{u.first_name}_#{u.last_name}.png", 'wb') do |f|
    f.write img
  end
  u.profile_pic = "#{u.first_name}_#{u.last_name}.png"
  u.save
end
puts 'Clientbase created!'

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


Ticket.all.each do |ticket|
  rand(5).times do
    user = User.all.sample
    ticket.comments.create(body: Faker::Hipster.paragraph,
                           user_id: user.id
    )
  end
end
puts "Comments created!"


puts '>>>>>> Seeding complete <<<<<<'
