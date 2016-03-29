require 'rails_helper'

RSpec.describe Question, type: :model do
  it { should have_many(:answers).dependent(:destroy) }
  it { should accept_nested_attributes_for :answers }
  it { should have_many(:comments).dependent(:destroy) }
  it { should have_many(:votes) }
end
