require 'rails_helper'

RSpec.describe 'yogi index page' do
  describe 'as a visitor' do
    describe 'when visiting /child_table_name' do
      it 'US3 displays every child and their attributes' do
        studio1 = Studio.create!(name: "BSY", rating: 5, accepting_members: true)
        tyler = Yogi.create!(name: "Tyler", age: 28, member: true, studio_id: studio1.id)
        antoine = Yogi.create!(name: "Antoine", age: 32, member: true, studio_id: studio1.id)

        visit "/yogis"
        
        expect(page).to have_content(tyler.name)
        expect(page).to have_content(tyler.age)
        expect(page).to have_content('Yes')
        expect(page).to have_content(tyler.studio_id)

        expect(page).to have_content(antoine.name)
        expect(page).to have_content(antoine.age)
        expect(page).to have_content(antoine.studio_id)
      end

      scenario 'US15 only display yogis if member is true' do
        studio = Studio.create!(name: "BSY", rating: 5, accepting_members: true)
        tyler = Yogi.create!(name: "Tyler", age: 28, member: true, studio_id: studio.id)
        antoine = Yogi.create!(name: "Antoine", age: 32, member: false, studio_id: studio.id)

        visit yogis_path

        click_link 'Only Show Members'

        expect(page).to have_content(tyler.name)
        expect(page).not_to have_content(antoine.name)
      end

      scenario 'US18.1 see a link that directs to the yogi edit page' do
        studio = Studio.create!(name: "BSY", rating: 5, accepting_members: true)
        tyler = Yogi.create!(name: "Tyler", age: 28, member: true, studio_id: studio.id)
        antoine = Yogi.create!(name: "Antoine", age: 32, member: true, studio_id: studio.id)

        visit "/yogis"
        
        expect(page).to have_link('Edit', href: edit_yogi_path(tyler))
        expect(page).to have_link('Edit', href: edit_yogi_path(antoine))
      end

      scenario 'US23.1 displays a button next to each yogi to delete that yogi' do
        studio = Studio.create!(name: "BSY", rating: 5, accepting_members: true)
        tyler = Yogi.create!(name: "Tyler", age: 28, member: true, studio_id: studio.id)
        antoine = Yogi.create!(name: "Antoine", age: 32, member: true, studio_id: studio.id)

        visit "/yogis"

        expect(page).to have_button('Delete', count: 2)

        click_button('Delete', match: :first)

        expect(page).to have_current_path("/yogis")
        expect(page).to have_content(antoine.name)
        expect(page).to_not have_content(tyler.name)
      end

    end
  end

end