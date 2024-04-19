require "factory_bot_rails"

FactoryBot.define do
  factory :post do
    title { "ABCD" }
    body { "Lorem Ipsum" }
  end
end
