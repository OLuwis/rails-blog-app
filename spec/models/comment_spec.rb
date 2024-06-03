require "rails_helper"

RSpec.describe Comment, type: :model do
  # Validations Tests
  describe "validations" do
    it {
      should validate_presence_of(:body)
      .with_message("Comment cannot be blank")
    }
  end

  # Associations Tests
  describe "associations" do
    it {
      should belong_to(:post)
      .required
    }

    it {
      should belong_to(:user)
      .optional
    }
  end

  # Columns Tests
  describe "columns" do
    it {
      should have_db_column(:body).of_type(:string)
    }

    it {
      should have_db_column(:created_at).of_type(:datetime)
    }

    it {
      should have_db_column(:updated_at).of_type(:datetime)
    }
  end
end
