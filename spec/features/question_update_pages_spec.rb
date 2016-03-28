require 'rails_helper'

describe 'the create a question path' do
  let!(:test_question) { create :question }

  it 'updates a question when the required fields are filled in' do
    visit root_path
    click_link "edit-question-#{test_question.id}"
    fill_in 'Content', with: 'New Content'
    click_button 'Update Question'
    expect(page).to have_content('New Content')
  end

  it 'gives an error message when the required fields are missing' do
    visit edit_question_path(test_question)
    fill_in 'Content', with: ''
    click_button 'Update Question'
    expect(page).to have_content('error')
  end
end
