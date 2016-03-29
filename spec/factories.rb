include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :question do
    transient do
      answers_count 2
    end

    after(:build) do |question, evaluator|
      question.answers << build_list(:answer, 2)
    end

    factory :question_with_description do
      sequence :content do |n|
        "Question #{n}"
      end
    end
  end

  factory :answer do
    sequence :content do |n|
      "Answer #{n}"
    end
    image { fixture_file_upload( File.join(Rails.root, 'spec', 'fixtures', 'images', 'cat.jpg'), 'image/jpeg') }
  end

  factory :comment do
    question
    sequence :content do |n|
      "Comment #{n}"
    end
  end
end
