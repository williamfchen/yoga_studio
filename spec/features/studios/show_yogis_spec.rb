require 'rails_helper'

RSpec.describe 'show studio yogis' do
  describe 'as a visitor' do
    describe 'when visiting /parents/:parent_id/child_table_name' do
      it 'US5 displays each child and atrributes associated with that parent' do
        studio1 = Studio.create!(name: "BSY", rating: 5, accepting_members?: true)
        tyler = Yogi.create!(name: "Tyler", age: 28, member?: true, studio_id: studio1.id)
        antoine = Yogi.create!(name: "Antoine", age: 32, member?: false, studio_id: studio1.id)

        visit "/studios/#{studio1.id}/yogis"

        expect(page).to have_content(studio1.name)
        expect(page).to have_content(tyler.name)
        expect(page).to have_content(tyler.age)
        expect(page).to have_content(tyler.member?)

        expect(page).to have_content(antoine.name)
        expect(page).to have_content(antoine.age)
        expect(page).to have_content(antoine.member?)
      end

    end
  end

end
