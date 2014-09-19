class User < ActiveRecord::Base
  has_many :questions
  has_many :answers, through: :questions
  has_many :responses, through: :answers
  has_many :votes, as: :voteable
end
