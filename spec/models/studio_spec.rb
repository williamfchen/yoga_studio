require "rails_helper"

RSpec.describe Studio, type: :model do
  describe 'relationship' do
    it { should have_many :yogis }
  end
  
  describe '#order_by' do
    it 'orders studios by creation date, descending' do
      studio1 = Studio.create!(name: "BSY", rating: 5, accepting_members: true)
      studio2 = Studio.create!(name: "Flex", rating: 4, accepting_members: false, created_at: 1.day.ago)

      expect(Studio.order_by).to eq([studio1, studio2])
    end
  end
  
  describe '#yogis_count' do
    it 'returns the count of associated yogis' do
      studio1 = Studio.create!(name: "BSY", rating: 5, accepting_members: true)
      tyler = Yogi.create!(name: "Tyler", age: 28, member: true, studio_id: studio1.id)
      antoine = Yogi.create!(name: "Antoine", age: 32, member: false, studio_id: studio1.id)
      
      expect(studio1.yogis_count).to eq(2)
    end
  end
  

end
