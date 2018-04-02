require 'rails_helper'

# Test suite for the Article model
RSpec.describe Article, type: :model do
  # Association test
  # ensure Todo model has a 1:m relationship with the Comment model
  it { should have_many(:comments).dependent(:destroy) }
  # Validation tests
  # ensure columns params are present before saving
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
end
