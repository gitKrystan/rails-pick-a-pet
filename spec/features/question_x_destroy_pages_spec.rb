require 'rails_helper'

describe 'the destroy a question path' do
  let!(:test_question) { create :question }

  it 'destroys a question' do
    visit edit_question_path(test_question)
    click_link "destroy-question-#{test_question.id}"
    expect(page).to have_content('deleted')
    expect(current_path).to eq questions_path
  end
end
