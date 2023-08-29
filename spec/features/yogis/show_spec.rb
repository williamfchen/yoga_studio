require 'rails_helper'

RSpec.feature 'show yogi' do
  describe 'as a visitor' do
    describe 'when visiting /child_table_name/:id' do
      scenario 'US4 displays child with attributes' do
        studio = Studio.create!(name: "BSY", rating: 5, accepting_members: true)
        tyler = Yogi.create!(name: "Tyler", age: 28, member: true, studio_id: studio.id)

        visit "/yogis/#{tyler.id}"

        expect(page).to have_content(tyler.name)
        expect(page).to have_content(tyler.age)
        expect(page).to have_content('Yes')
        expect(page).to have_content(tyler.studio_id)
        expect(page).to have_content(tyler.created_at)
        expect(page).to have_content(tyler.updated_at)
      end

      scenario 'US14 diplays a link to update the child with a form' do
        studio = Studio.create!(name: "Flex", rating: 3, accepting_members: true)
        tyler = Yogi.create!(name: "Tyler", age: 28, member: true, studio_id: studio.id)

        visit "/yogis/#{tyler.id}"
        
        expect(page).to have_button('Update Yogi')

        click_button('Update Yogi')

        expect(page).to have_current_path(edit_yogi_path(tyler))
        expect(page).to have_selector('form')

        fill_in 'name', with: 'Antoine'
        fill_in 'age', with: '54'
        uncheck 'member'

        click_button 'Update Yogi'

        expect(page).to have_current_path(yogi_path(tyler))
        expect(page).to have_content('Name: Antoine')
        expect(page).to have_content('Age: 54')
        expect(page).to have_content('Member? No')
      end

      scenario 'US20 displays a link to delete the child' do
        studio = Studio.create!(name: "Flex", rating: 3, accepting_members: true)
        tyler = Yogi.create!(name: "Tyler", age: 28, member: true, studio_id: studio.id)
        
        visit "/yogis/#{tyler.id}"

        expect(page).to have_button('Delete Yogi')

        click_button('Delete Yogi')
        
        expect(page).to have_current_path(yogis_path)
        expect(page).to_not have_content(tyler.name)
      end
    end
  end
end
