require 'rails_helper'

RSpec.describe Manga, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :status }
  end
  describe 'scope' do
    let(:manga1) { create(:manga, name: 'A ride', status: 'ongoing') }
    let(:manga2) { create(:manga, name: 'B ride', status: 'ongoing') }
    it 'find_chap' do
      create(:chapter, name: 'zzz', manga_id: manga1.id, created_at: Time.now)
      create(:chapter, name: 'zzz1', manga_id: manga1.id, created_at: Time.now + 10.days)
      create(:chapter, name: 'zzz2', manga_id: manga2.id, created_at: Time.now + 20.days)
      expect(Manga.chap).to eq([manga1, manga2])
    end
    it 'find_name' do
      expect(Manga.find_name).to eq([manga1, manga2])
    end
    it 'find_date' do
      create(:chapter, name: 'zzz', manga_id: manga1.id, created_at: Time.now)
      create(:chapter, name: 'zzz1', manga_id: manga1.id, created_at: Time.now + 10.days)
      create(:chapter, name: 'zzz2', manga_id: manga2.id, created_at: Time.now + 20.days)
      expect(Manga.date).to eq([manga2, manga1])
    end
  end
end
