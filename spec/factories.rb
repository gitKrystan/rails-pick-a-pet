FactoryGirl.define do
  factory :question do
    after(:build) do |question|
      create_list(:answer, 2, question: question)
    end
  end

  factory :answer do
    sequence :content do |n|
      "Answer #{n}"
    end
  end
end
