FactoryBot.define do
  factory :post do
    user

    body { "MyString" }
    image { fixture_file_upload(Rails.root.join("spec/fixtures/1.png")) }
  end
end
