class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :votes, dependent: :destroy
  validates :content, presence: true

  def vote_count
    votes.count
  end

  def votes?
    vote_count > 0
  end
end
