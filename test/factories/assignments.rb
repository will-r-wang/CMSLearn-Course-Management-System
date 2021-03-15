FactoryBot.define do
  factory :assignment do
    due_date { "2021-03-05 09:26:04" }
    submission_type { "MyString" }
    grade { 1 }
  end
end
