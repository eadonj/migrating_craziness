# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article do
    title "This is a title"
    description "This is a description"
    category
  end
end
