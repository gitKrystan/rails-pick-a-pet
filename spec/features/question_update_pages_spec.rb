require 'rails_helper'

describe 'the update a question path' do
  let!(:test_question) { create :question }

  # it 'updates a question when the required fields are filled in' do
  #   visit root_path
  #   click_link "edit-question-#{test_question.id}"
  #   fill_in 'Content', with: 'New Content'
  #   click_button 'Update Question'
  #   expect(page).to have_content('New Content')
  #   expect(current_path).to eq questions_path
  # end
  #
  # it 'gives an error message when the required fields are missing' do
  #   visit edit_question_path(test_question)
  #   fill_in 'Content', with: ''
  #   click_button 'Update Question'
  #   expect(page).to have_content('error')
  #   expect(current_path).to eq question_path(test_question)
  # end
end
