class Answer < ActiveRecord::Base
  belongs_to :user
  has_many :responses
  has_many :votes, as: :voteable
end

