require 'rails_helper'

RSpec.describe 'studio index page' do
  describe 'as a visitor' do
    describe 'when visiting /parents' do
      
      it 'US1 displays the name of each parent record in the system' do
        studio1 = Studio.create!(name: "BSY", rating: 5, accepting_members?: true)
        studio2 = Studio.create!(name: "Flex", rating: 5, accepting_members?: true)

        visit "/studios"

        expect(page).to have_content(studio1.name)
        expect(page).to have_content(studio2.name)
      end

      it 'US6 displays studio names by descending created_at' do
        studio1 = Studio.create!(name: "BSY", rating: 5, accepting_members?: true)
        studio2 = Studio.create!(name: "Flex", rating: 5, accepting_members?: true, created_at: 1.day.ago)

        visit "/studios"

        studio_rows = page.all('table tbody tr')
        studio1_index = studio_rows.find_index { |row| row.has_content?(studio1.name) }
        studio2_index = studio_rows.find_index { |row| row.has_content?(studio2.name) }
        expect(studio1_index).to be < studio2_index
      end

    end

    


  end

end

