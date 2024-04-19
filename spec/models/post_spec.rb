require "rails_helper"
require "factory_bot_rails"
require "securerandom"

describe Post, type: :model do
  describe "validations" do
    it "validates the length of title" do
      expect(FactoryBot.build(:post)).to be_valid
      expect(FactoryBot.build(:post, title: "a" * 151)).not_to be_valid
    end

    it "validates the presence of title" do
      expect(FactoryBot.build(:post)).to be_valid
      expect(FactoryBot.build(:post, title: nil)).not_to be_valid
    end

    it "validates the presence of text" do
      expect(FactoryBot.build(:post)).to be_valid
      expect(FactoryBot.build(:post, body: nil)).not_to be_valid
    end

    it "validates the message for blank text" do
      post = FactoryBot.build(:post, title: "a" * 151)
      post.valid?
      expect(post.errors[:title]).to include("Title cannot exceed 150 characters")
    end

    it "validates the message for blank title" do
      post = FactoryBot.build(:post, title: nil)
      post.valid?
      expect(post.errors[:title]).to include("Title cannot be blank")
    end

    it "validates the message for blank text" do
      post = FactoryBot.build(:post, body: nil)
      post.valid?
      expect(post.errors[:body]).to include("Body cannot be blank")
    end
  end
end
