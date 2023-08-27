require 'rails_helper'

RSpec.describe 'displays index page' do
  describe 'as a visitor' do
    describe 'when visiting /child_table_name' do
      it 'US3 displays every child and their attributes' do
        studio1 = Studio.create!(name: "BSY", rating: 5, accepting_members: true)
        tyler = Yogi.create!(name: "Tyler", age: 28, member: true, studio_id: studio1.id)
        antoine = Yogi.create!(name: "Antoine", age: 32, member: false, studio_id: studio1.id)

        visit "/yogis"
        
        expect(page).to have_content(tyler.name)
        expect(page).to have_content(tyler.age)
        expect(page).to have_content(tyler.member)
        expect(page).to have_content(tyler.studio_id)

        expect(page).to have_content(antoine.name)
        expect(page).to have_content(antoine.age)
        expect(page).to have_content(antoine.member)
        expect(page).to have_content(antoine.studio_id)
      end
    end
  end

end