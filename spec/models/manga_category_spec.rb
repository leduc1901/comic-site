require 'rails_helper'

RSpec.describe MangaCategory, type: :model do
  describe 'validations' do
    it { should validate_presence_of :manga_id }
    it { should validate_presence_of :category_id }
  end
end
