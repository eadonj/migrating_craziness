# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :url do
    old_url "/articles/6/1/2013/jiberish"
    article
  end
end
