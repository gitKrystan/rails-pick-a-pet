class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers
  validates :answers, presence: true

  has_many :comments, dependent: :destroy
end
