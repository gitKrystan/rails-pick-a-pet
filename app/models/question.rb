class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers
  validates :answers, presence: true

  has_many :comments, dependent: :destroy

  def first_answer
    answers[0]
  end

  def second_answer
    answers[1]
  end
end
