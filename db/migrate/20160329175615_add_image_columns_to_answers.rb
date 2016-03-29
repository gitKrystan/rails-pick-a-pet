class AddImageColumnsToAnswers < ActiveRecord::Migration
  def up
    add_attachment :answers, :image
  end

  def down
    remove_attachment :answers, :image
  end
end
