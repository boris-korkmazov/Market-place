require 'rails_helper'

RSpec.describe Lesson, type: :model do
  it { should belong_to :user}
  it { should have_many :comments}
  it { should validate_presence_of :title}
  it { should validate_presence_of :description}
  it { should validate_presence_of :video}
end
