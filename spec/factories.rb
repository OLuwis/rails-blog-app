require "factory_bot_rails"

FactoryBot.define do
  factory :text do
    file { nil }
  end

  factory :post_tag do
    
  end

  factory :tag do
    name { "MyString" }
  end

  factory :user do
    
  end

  factory :comment do
    body { "Comment" }
    post { 1 }
  end

  factory :post do
    title { "Title" }
    body { "Text" }
  end
end
