require 'rails_helper'

RSpec.describe Chapter, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :manga_id }
  end
  describe 'func' do
    let(:manga1) { create(:manga, name: 'A ride', status: 'ongoing') }
    it 'next' do
      chap1 = create(:chapter, name: 'zzz', manga_id: manga1.id, created_at: Time.now)
      chap2 = create(:chapter, name: 'zzz1', manga_id: manga1.id, created_at: Time.now + 10.days)
      expect(chap1.next).to eq(chap2)
    end
    it 'previous' do
      chap1 = create(:chapter, name: 'zzz', manga_id: manga1.id, created_at: Time.now)
      chap2 = create(:chapter, name: 'zzz1', manga_id: manga1.id, created_at: Time.now + 10.days)
      expect(chap2.previous).to eq(chap1)
    end
  end
end
