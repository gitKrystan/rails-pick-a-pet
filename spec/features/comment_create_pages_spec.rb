require "rails_helper"

describe 'the add a comment path' do
  let!(:test_question) { create :question }
  let!(:test_comment_attributes) { attributes_for :comment, question: nil }

  it 'allows a uer to add a comment' do
    visit root_path
    within("#comment-question-#{test_question.id}") do
      fill_in 'comment_content', with: test_comment_attributes[:content]
      click_button 'Comment'
    end
    expect(page).to have_content(test_comment_attributes[:content])
    expect(current_path).to eq questions_path
  end
end
