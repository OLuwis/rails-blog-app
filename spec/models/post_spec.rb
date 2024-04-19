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

    
  end
end
