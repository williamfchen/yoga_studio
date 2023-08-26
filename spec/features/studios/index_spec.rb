require 'rails_helper'

RSpec.describe 'studio index page' do
  describe 'as a visitor' do
    # let(:bsy) { Studio.create!(name: "BSY", rating: 5, accepting_members: true) }
    # let(:flex) { Studio.create!(name: "Flex", rating: 2, accepting_members: false) }
    # let(:tyler) { bsy.yogis.create!(name: "Tyler", age: 28, member: true) }
    # let(:antoine) { bsy.yogis.create!(name: "Antoine", age: 32, member: false) }

    describe 'when visiting /parents' do
      it 'US1 displays the name of each parent record in the system' do
        studio1 = Studio.create!(name: "BSY", rating: 5, accepting_members?: true)
        studio2 = Studio.create!(name: "Flex", rating: 4, accepting_members?: false)

        visit "/studios"

        expect(page).to have_content(studio1.name)
        expect(page).to have_content(studio2.name)
      end
    end

    


  end

end

