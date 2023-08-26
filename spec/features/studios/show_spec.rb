require 'rails_helper'

RSpec.describe 'studio show page' do
  describe 'as a visitor' do
    describe 'when visiting /parents/:id' do
      it 'US2 displays the parent with that id and all attributes' do
        studio1 = Studio.create!(name: "BSY", rating: 5, accepting_members: true)
        studio2 = Studio.create!(name: "Flex", rating: 5, accepting_members: true)

        visit "/studios/#{studio1.id}"

        expect(page).to have_content(studio1.name)
        expect(page).to have_content(studio1.rating)
        expect(page).to have_content(studio1.accepting_members)
        expect(page).to have_content(studio1.created_at)
        expect(page).to have_content(studio1.updated_at)
        expect(page).to_not have_content(studio2.name)
      end
    end
  end

end


