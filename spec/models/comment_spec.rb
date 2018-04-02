require 'rails_helper'

# Test suite for the Comment model
RSpec.describe Comment, type: :model do
  # Association test
  # ensure an comment record belongs to a single article record
  it { should belong_to(:article) }
  # Validation test
  # ensure params is present before saving
  it { should validate_presence_of(:commenter) }
  it { should validate_presence_of(:body) }
end
