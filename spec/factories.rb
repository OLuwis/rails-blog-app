require "factory_bot_rails"

FactoryBot.define do
  factory :comment do
    body { "MyString" }
    post { nil }
  end

  factory :post do
    title { "ABCD" }
    body { "Lorem Ipsum" }
  end
end
