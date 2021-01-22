require 'rails_helper'

RSpec.describe Subcribe, type: :model do
  describe 'validations' do
    it { should validate_presence_of :manga_id }
    it { should validate_presence_of :user_id }
  end
end
