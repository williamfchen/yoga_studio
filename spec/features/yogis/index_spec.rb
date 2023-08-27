require 'rails_helper'

RSpec.describe 'displays index page' do
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
        studio1 = Studio.create!(name: "BSY", rating: 5, accepting_members: true)
        tyler = Yogi.create!(name: "Tyler", age: 28, member: true, studio_id: studio1.id)
        antoine = Yogi.create!(name: "Antoine", age: 32, member: false, studio_id: studio1.id)

        visit yogis_path

        expect(page).to have_content(tyler.name)
        expect(page).not_to have_content(antoine.name)
      end
    end
  end

end