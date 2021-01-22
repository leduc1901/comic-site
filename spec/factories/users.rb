FactoryBot.define do
  factory :user do
    name { 'MyString' }
    email { 'string@gmail.com' }
    user_level { 1 }
    password { '123456' }
  end
end
