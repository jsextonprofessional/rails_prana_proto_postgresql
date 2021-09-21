FactoryBot.define do
  factory :search do
    keywords { "MyString" }
    asana_name { "MyString" }
    asana_type { "MyString" }
    target_general { "MyString" }
    target_specific { "MyString" }
    difficulty { "MyString" }
    duration { 1 }
  end
end
