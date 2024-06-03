require "rails_helper"

RSpec.describe Post, type: :model do
  # Validations Tests
  describe "validations" do
    it {
      should validate_length_of(:title)
      .is_at_most(150)
      .with_message("Title cannot exceed 150 characters")
    }

    it {
      should validate_presence_of(:title)
      .with_message("Title cannot be blank")
    }

    it {
      should validate_presence_of(:body)
      .with_message("Text cannot be blank")
    }
  end

  # Associations Tests
  describe "associations" do
    it {
      should belong_to(:user)
      .required
    }

    it {
      should have_many(:comments)
      .dependent(:destroy)
    }

    it {
      should have_many(:post_tags)
      .dependent(:destroy)
    }

    it {
      should have_many(:tags)
      .through(:post_tags)
    }
  end

  # Columns Tests
  describe "columns" do
    it {
      should have_db_column(:title).of_type(:string)
    }

    it {
      should have_db_column(:body).of_type(:text)
    }

    it {
      should have_db_column(:created_at).of_type(:datetime)
    }

    it {
      should have_db_column(:updated_at).of_type(:datetime)
    }
  end
end
