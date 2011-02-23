# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

user = User.create :email => 'mary@example.com',
                   :password => 'secret',
                   :password_confirmation => 'secret'
Category.create [{:name => 'Programming'},
                 {:name => 'Event'},
                 {:name => 'Travel'},
                 {:name => 'Music'},
                 {:name => 'TV'}]
user.posts.create :name => 'Nash',
                  :title => 'Advanced Active Record',
             :content => "Models need to relate to each other. In the real world, ..",
             :created_at => Date.today
user.posts.create :name => 'Nash',
                  :title => 'One-to-many associations',
             :content => "One-to-many associations describe a pattern ..",
             :created_at => Date.today
user.posts.create :name => 'Nash',
                  :title => 'Associations',
             :content => "Active Record makes working with associations easy..",
             :created_at => Date.today
