require "rails_helper"

RSpec.describe Tag, type: :model do
  # Validations Tests
  describe "validations" do
    subject { Tag.new(id: 1) }

    it {
      should validate_presence_of(:name)
    }

    it {
      should validate_uniqueness_of(:name)
    }
  end

  # Associations Tests
  describe "associations" do
    it {
      should have_many(:post_tags)
    }

    it {
      should have_many(:posts)
      .through(:post_tags)
    }
  end

  # Columns Tests
  describe "columns" do
    it {
      should have_db_index(:name).unique
    }

    it {
      should have_db_column(:name).of_type(:string)
    }

    it {
      should have_db_column(:created_at).of_type(:datetime)
    }

    it {
      should have_db_column(:updated_at).of_type(:datetime)
    }
  end
end
