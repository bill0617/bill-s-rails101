# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Hello World!"
create_account = User.create([email: 'example@gmail.com', password: '12345678', password_confirmation: '12345678', name: '測試帳號'])
crate_groups = for i in 1..20 do	
 Group.create!([title: "Group no.#{i}", description: "第#{i}筆資料", user_id: "1"])
               for k in 1..25 do
Post.create!([group_id: "#{i}", content: "第#{k}個留言", user_id: "1"])
end
end
