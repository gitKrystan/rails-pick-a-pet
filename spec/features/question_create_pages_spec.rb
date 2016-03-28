require 'rails_helper'

describe 'the create a question path' do
  let!(:test_question) { attributes_for :question }

  it 'creates a question when the required fields are filled in' do
    visit root_path
    click_link 'New Choice'
    fill_in 'Content', with: test_question[:content]
    click_button 'Create Question'
    expect(page).to have_content(test_question[:content])
  end

  it 'gives an error message when the required fields are missing' do
    visit new_question_path
    click_button 'Create Question'
    expect(page).to have_content('error')
  end
end
