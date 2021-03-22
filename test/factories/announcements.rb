FactoryBot.define do
  factory :announcement do
    announcement_content { "MyText" }
    pinned { false }
  end
end
