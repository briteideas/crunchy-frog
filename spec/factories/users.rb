FactoryGirl.define do
  factory :user do
    email { ('a'..'z').to_a.shuffle.join + "@cloudbot.com" }
  end
end
