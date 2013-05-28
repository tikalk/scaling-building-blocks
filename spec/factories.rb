FactoryGirl.define do
  factory :product do
    after :create, &:confirm!
  end
end