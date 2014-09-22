FactoryGirl.define do

  factory :question do
    title {Faker::Lorem.word}
    body {Faker::Lorem.sentence}
  end

  factory :answer do
  	body { Faker::Lorem.sentence }
  end

  factory :user do
  	username { Faker::Name.name }
    about { Faker::Lorem.sentence}
  	password_hash { Faker::Internet.password(10) }
  	password_salt { Faker::Internet.password(20) }
  end


  factory :response do
    body { Faker::Lorem.sentence }
  end

  factory :vote do 

  end
end