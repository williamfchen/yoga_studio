require 'rails_helper'

RSpec.feature 'show studio yogis' do
  describe 'as a visitor' do
    describe 'when visiting /parents/:parent_id/child_table_name' do
      scenario 'US5 displays each child and atrributes associated with that parent' do
        studio = Studio.create!(name: "BSY", rating: 5, accepting_members: true)
        tyler = Yogi.create!(name: "Tyler", age: 28, member: true, studio_id: studio.id)
        antoine = Yogi.create!(name: "Antoine", age: 32, member: false, studio_id: studio.id)

        visit "/studios/#{studio.id}/yogis"

        expect(page).to have_content(studio.name)
        expect(page).to have_content(tyler.name)
        expect(page).to have_content(tyler.age)
        expect(page).to have_content('Yes')

        expect(page).to have_content(antoine.name)
        expect(page).to have_content(antoine.age)
        expect(page).to have_content('No')
      end

      scenario 'US13 displays a link to create child' do
        studio = Studio.create!(name: "BSY", rating: 5, accepting_members: true)

        visit "/studios/#{studio.id}/yogis"

        expect(page).to have_link('Add Yogi', href: add_yogi_path(studio))

        click_link('Add Yogi')

        expect(page).to have_selector('form')

        fill_in 'yogi[name]', with: 'Tyler'
        fill_in 'yogi[age]', with: '28'
        check 'yogi[member]'

        click_button 'Add Yogi'

        expect(page).to have_current_path(show_studio_yogis_path(studio))
        expect(page).to have_content('Tyler')
        expect(page).to have_content(28)
        expect(page).to have_content('Yes')
      end

      scenario 'US18.2 see a link that directs to the yogi edit page' do
        studio1 = Studio.create!(name: "BSY", rating: 5, accepting_members: true)
        tyler = Yogi.create!(name: "Tyler", age: 28, member: true, studio_id: studio1.id)
        antoine = Yogi.create!(name: "Antoine", age: 32, member: false, studio_id: studio1.id)

        visit "/studios/#{studio1.id}/yogis"

        expect(page).to have_link('Edit', href: edit_yogi_path(tyler))
        expect(page).to have_link('Edit', href: edit_yogi_path(antoine))
      end
    end
  end

end
