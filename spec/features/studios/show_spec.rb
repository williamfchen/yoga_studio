require 'rails_helper'

RSpec.feature 'studio show page' do
  describe 'as a visitor' do
    describe 'when visiting /parents/:id' do
      scenario 'US2 displays the parent with that id and all attributes' do
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

      scenario 'US7 displays the child count' do
        studio1 = Studio.create!(name: "BSY", rating: 5, accepting_members: true)
        tyler = Yogi.create!(name: "Tyler", age: 28, member: true, studio_id: studio1.id)
        antoine = Yogi.create!(name: "Antoine", age: 32, member: false, studio_id: studio1.id)

        visit "/studios/#{studio1.id}"
        expect(page).to have_content("Yogis: #{studio1.yogis_count}")
      end

      scenario 'US10 displays a link to take me to parents child table name' do
        studio = Studio.create!(name: "BSY", rating: 5, accepting_members: true)

        visit "/studios/#{studio.id}"

        expect(page).to have_link('View Yogis', href: studio_yogis_path(studio))
      end

      scenario 'US12 displays a link to update parent with a form' do
        studio = Studio.create!(name: "Flex", rating: 3, accepting_members: true)

        visit "/studios/#{studio.id}"

        expect(page).to have_link('Update Studio', href: edit_studio_path(studio.id))

        click_link('Update Studio')

        expect(page).to have_selector('form')
        save_and_open_page
        fill_in 'studio[name]', with: 'Stretch'
        fill_in 'studio[rating]', with: '4'
        uncheck 'studio[accepting_members]'

        click_button 'Update Studio'

        expect(page).to have_current_path(studio_path(studio))
        expect(page).to have_content('Name: Stretch')
        expect(page).to have_content('Rating: 4')
        expect(page).to have_content('Accepting Members? false')
      end
    end
  end

end


