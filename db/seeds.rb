# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


10.times{User.create(username: Faker::Internet.user_name, password: Faker::Internet.password)}

User.all.each do |user|
	user.questions << Question.create(title: Faker::Lorem.sentence, body: Faker::Lorem.sentence(1), user_id: user.id)
end


User.all.shuffle.each do |user|
		Question.all.each do |q|
			q.answers << Answer.create(body: Faker::Lorem.sentence(3), user_id: user.id)
	end
end

User.all.each do |user|
	Answer.all.shuffle.each do |a|
		a.responses << Response.create(body: Faker::Lorem.sentence(3))
	end
end

class UserSeeder
  def self.seed
    10.times do
      User.create(username: Faker::Internet.user_name, password: Faker::Internet.password)
    end
  end
end

class QuestionSeeder
  def self.seed
    30.times do
      user = User.find(rand(10) + 1)
      user.questions.create(title: Faker::Lorem.sentence(4, false, 6), body: Faker::Lorem.paragraph(3, false, 5))
    end
  end
end

class AnswerSeeder
  def self.seed
    70.times do
      Question.find(rand(10) + 1).answers.create(body: Faker::Lorem.paragraph(2, false, 3), user_id: rand(30) + 1)
    end
  end
end

class ResponseSeeder
  def self.seed
    40.times do
      Answer.find(rand(30) + 1).responses.create(body: Faker::Lorem.sentence(4, false, 6), user_id: rand(30) + 1)
    end
  end
end

class VotesSeeder
  def self.seed
    100.times do
      Question.find(rand(30) + 1).votes.create
      Answer.find(rand(70) + 1).votes.create
    end
  end
end

# UserSeeder.seed
# QuestionSeeder.seed
# AnswerSeeder.seed
# ResponseSeeder.seed
# VotesSeeder.seed
