class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :votes, dependent: :destroy
  validates :content, presence: true
  has_attached_file :image, styles: { thumb: "300x300#" }
  validates_attachment :image, presence: true,
    content_type: { content_type: /\Aimage\/.*\Z/ },
    size: { in: 0..2.megabytes }

  def vote_count
    votes.count
  end

  def votes?
    vote_count > 0
  end
end
