require 'rails_helper'

describe 'the vote on an answer path' do
  let!(:test_question) { create :question }
  let!(:test_answer_1) { test_question.answers[0] }
  let!(:test_answer_2) { test_question.answers[1] }

  it 'allows a user to vote for an answer', js: true do
    visit root_path
    click_on test_answer_1.content
    expect(page).to have_content('Thanks for voting!')
    expect(current_path).to eq root_path
  end

  it 'allows a user to vote for an answer without javascript' do
    visit root_path
    click_button "vote-answer-#{test_answer_1.id}"
    expect(page).to have_content('Thanks for voting!')
    expect(current_path).to eq questions_path
  end
end
