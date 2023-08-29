require 'rails_helper'

RSpec.feature 'show studio page' do
  describe 'as a visitor' do
    describe 'when visiting /parents/:id' do
      scenario 'US2 displays the parent with that id and all attributes' do
        studio1 = Studio.create!(name: "BSY", rating: 5, accepting_members: true)
        studio2 = Studio.create!(name: "Flex", rating: 5, accepting_members: true)

        visit "/studios/#{studio1.id}"

        expect(page).to have_content(studio1.name)
        expect(page).to have_content(studio1.rating)
        expect(page).to have_content('Yes')
        expect(page).to have_content(studio1.created_at)
        expect(page).to have_content(studio1.updated_at)
        expect(page).to_not have_content(studio2.name)
      end

      scenario 'US7 displays the child count' do
        studio = Studio.create!(name: "BSY", rating: 5, accepting_members: true)
        tyler = Yogi.create!(name: "Tyler", age: 28, member: true, studio_id: studio.id)
        antoine = Yogi.create!(name: "Antoine", age: 32, member: false, studio_id: studio.id)

        visit "/studios/#{studio.id}"
        expect(page).to have_content("Yogis: #{studio.yogis_count}")
      end

      scenario 'US10 displays a link to take me to parents child table name' do
        studio = Studio.create!(name: "BSY", rating: 5, accepting_members: true)

        visit "/studios/#{studio.id}"

        expect(page).to have_button('View Yogis')

        click_button('View Yogis')

        expect(page).to have_current_path("/studios/#{studio.id}/yogis")
      end

      scenario 'US12 displays a link to update parent with a form' do
        studio = Studio.create!(name: "Flex", rating: 3, accepting_members: true)

        visit "/studios/#{studio.id}"
        
        expect(page).to have_button('Update Studio')

        click_button('Update Studio')

        expect(page).to have_current_path("/studios/#{studio.id}/edit")
        expect(page).to have_selector('form')

        fill_in 'name', with: 'Stretch'
        fill_in 'rating', with: '4'
        uncheck 'accepting_members'

        click_button 'Update Studio'

        expect(page).to have_current_path(studio_path(studio))
        expect(page).to have_content('Name: Stretch')
        expect(page).to have_content('Rating: 4')
        expect(page).to have_content('Accepting Members? No')
      end

      scenario 'US19 displays a link to delete the parent' do
        studio = Studio.create!(name: "Flex", rating: 3, accepting_members: true)
        tyler = Yogi.create!(name: "Tyler", age: 28, member: true, studio_id: studio.id)
        antoine = Yogi.create!(name: "Antoine", age: 32, member: true, studio_id: studio.id)
        
        visit "/studios/#{studio.id}"

        expect(page).to have_button('Delete Studio')

        click_button('Delete Studio')
        
        expect(page).to have_current_path(studios_path)
        expect(page).to_not have_content(studio.name)

        visit "/yogis"
        
        expect(page).to_not have_content(tyler.name)
        expect(page).to_not have_content(antoine.name)
      end
    end
  end

end


