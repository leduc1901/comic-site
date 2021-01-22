FactoryBot.define do
  factory :manga do
    views_count { 0 }
    author_id { 1 }
    status { 'ongoing' }
    user_id { 1 }
    banner_img { 'MyText' }
    description { 'dummy text' }
  end
end
