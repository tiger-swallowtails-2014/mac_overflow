class QuestionSeeder
  def self.seed
    10.times do
      Question.create(title: Faker::Lorem.sentence(4, false, 6), body: Faker::Lorem.paragraph(3, false, 5))
    end
  end
end

class AnswerSeeder
  def self.seed
    30.times do
      Question.find(rand(10) + 1).answers.create(body: Faker::Lorem.paragraph(2, false, 3))
    end
  end
end

class ResponseSeeder
  def self.seed
    Answer.find(rand(30) + 1).responses.create(body: Faker::Lorem.sentence(4, false, 6))
  end
end

QuestionSeeder.seed
AnswerSeeder.seed
ResponseSeeder.seed