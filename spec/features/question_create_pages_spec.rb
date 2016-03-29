require 'rails_helper'

describe 'the create a question path' do
  let!(:test_answer_1_attributes) { attributes_for :answer }
  let!(:test_answer_2_attributes) { attributes_for :answer }

  it 'creates a question and answers when the required fields are filled in' do
    visit root_path
    first(:link, 'New Choice').click
    fill_in 'answer-1-content', with: test_answer_1_attributes[:content]
    page.attach_file('image-1', 'spec/fixtures/images/cat.jpg')
    fill_in 'answer-2-content', with: test_answer_2_attributes[:content]
    page.attach_file('image-2', 'spec/fixtures/images/cat.jpg')
    click_button 'Create Question'
    expect(page).to have_content(test_answer_1_attributes[:content])
    expect(page).to have_css("img[src*='cat.jpg']")
    expect(current_path).to eq questions_path
  end

  it 'gives an error message when the required fields are missing' do
    visit new_question_path
    click_button 'Create Question'
    expect(page).to have_content('error')
    expect(current_path).to eq questions_path
  end

  let!(:question_with_description) { attributes_for :question_with_description }

  it 'creates a question and answers when all fields are filled in' do
    visit new_question_path
    fill_in 'answer-1-content', with: test_answer_1_attributes[:content]
    fill_in 'answer-2-content', with: test_answer_2_attributes[:content]
    fill_in 'Description', with: question_with_description[:description]
    click_button 'Create Question'
    expect(page).to have_content(question_with_description[:description])
    expect(current_path).to eq questions_path
  end
end
