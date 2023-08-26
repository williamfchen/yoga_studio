require 'rails_helper'

RSpec.describe 'studio show page' do
  describe 'as a visitor' do
    describe 'when visiting /parents/:id' do
      it 'US2 displays the parent with that id and all attributes' do
        studio1 = Studio.create!(name: "BSY", rating: 5, accepting_members?: true)
        studio2 = Studio.create!(name: "Flex", rating: 5, accepting_members?: true)

        visit "/studios/#{studio1.id}"

        expect(page).to have_content(studio1.name)
        expect(page).to have_content(studio1.rating)
        expect(page).to have_content(studio1.accepting_members?)
        expect(page).to have_content(studio1.created_at)
        expect(page).to have_content(studio1.updated_at)
        expect(page).to_not have_content(studio2.name)
      end

      it 'US7 displays the child count' do
        studio1 = Studio.create!(name: "BSY", rating: 5, accepting_members?: true)
        tyler = Yogi.create!(name: "Tyler", age: 28, member?: true, studio_id: studio1.id)
        antoine = Yogi.create!(name: "Antoine", age: 32, member?: false, studio_id: studio1.id)

        visit "/studios/#{studio1.id}"
        expect(page).to have_content("Yogis: #{studio1.yogis_count}")
      end

      it 'US10 displays a link to take me to parents child table name' do
        studio = Studio.create!(name: "BSY", rating: 5, accepting_members?: true)

        visit "/studios/#{studio.id}"

        expect(page).to have_link('View Yogis', href: studio_yogis_path(studio))
      end
    end
  end

end


