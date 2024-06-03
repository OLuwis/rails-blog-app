require "rails_helper"

RSpec.describe User, type: :model do
  # Validations Tests
  describe "validations" do
    it {
      should validate_presence_of(:name)
    }

    it {
      should validate_presence_of(:surname)
    }

    it {
      should validate_presence_of(:email)
    }

    it {
      should validate_presence_of(:password)
    }

    subject { User.new(id: 1, password: "Pa$$w0rd", name: "name", surname: "surname") }

    it {
      should validate_uniqueness_of(:email).ignoring_case_sensitivity
    }
  end

  # Associations Tests
  describe "associations" do
    it {
      should have_many(:posts)
      .dependent(:destroy)
    }

    it {
      should have_many(:comments)
      .dependent(:destroy)
    }
  end

  # Columns Tests
  describe "columns" do
    it {
      should have_db_index(:email)
    }

    it {
      should have_db_index(:reset_password_token)
    }

    it {
      should have_db_column(:name).of_type(:string)
    }

    it {
      should have_db_column(:surname).of_type(:string)
    }

    it {
      should have_db_column(:email).of_type(:string)
    }

    it {
      should have_db_column(:encrypted_password).of_type(:string)
    }

    it {
      should have_db_column(:reset_password_token).of_type(:string)
    }

    it {
      should have_db_column(:reset_password_sent_at).of_type(:datetime)
    }

    it {
      should have_db_column(:remember_created_at).of_type(:datetime)
    }

    it {
      should have_db_column(:created_at).of_type(:datetime)
    }

    it {
      should have_db_column(:updated_at).of_type(:datetime)
    }
  end
end
