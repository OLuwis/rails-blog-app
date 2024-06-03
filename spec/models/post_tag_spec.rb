require "rails_helper"

RSpec.describe PostTag, type: :model do
  # Associations Tests
  describe "associations" do
    it {
      should belong_to(:post)
    }

    it {
      should belong_to(:tag)
    }
  end

  # Columns Tests
  describe "columns" do
    it {
      should have_db_column(:created_at).of_type(:datetime)
    }

    it {
      should have_db_column(:updated_at).of_type(:datetime)
    }
  end
end
