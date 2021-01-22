FactoryBot.define do
  factory :chapter do
    manga_id { 1 }
    content { 'MyText' }
    page_size { 1 }
  end
end
