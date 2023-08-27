require "rails_helper"

RSpec.describe Yogi, type: :model do
  describe 'relationship' do
    it { should belong_to :studio }
  end

  it 'returns only yogis where member is true' do
    studio1 = Studio.create!(name: "BSY", rating: 5, accepting_members: true)
    tyler = Yogi.create!(name: "Tyler", age: 28, member: true, studio_id: studio1.id)
    antoine = Yogi.create!(name: "Antoine", age: 32, member: false, studio_id: studio1.id)

    expect(Yogi.members).to eq([tyler])
  end
end