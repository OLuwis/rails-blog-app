require "rails_helper"

RSpec.describe Text, type: :model do
  # Associations Tests
  describe "associations" do
    it {
      should have_one_attached(:file)
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
