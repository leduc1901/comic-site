FactoryBot.define do
  factory :comment do
    manga_id { 1 }
    user_id { 1 }
    content { 'MyText' }
    parent_id { 1 }
  end
end
