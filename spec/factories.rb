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
  end
end
