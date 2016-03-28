require 'rails_helper'

describe 'the create a question path' do
  let!(:test_question) { attributes_for :question }

  it 'creates a question when the required fields are filled in' do
    visit root_path
    first(:link, 'New Choice').click
    fill_in 'Content', with: test_question[:content]
    click_button 'Create Question'
    expect(page).to have_content(test_question[:content])
    expect(current_path).to eq questions_path
  end
  # 
  # it 'gives an error message when the required fields are missing' do
  #   visit new_question_path
  #   click_button 'Create Question'
  #   expect(page).to have_content('error')
  #   expect(current_path).to eq questions_path
  # end
end
