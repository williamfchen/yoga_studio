require 'rails_helper'

RSpec.describe 'show yogi' do
  describe 'as a visitor' do
    describe 'when visiting /child_table_name/:id' do
      it 'US4 displays child with attributes' do
        studio1 = Studio.create!(name: "BSY", rating: 5, accepting_members: true)
        tyler = Yogi.create!(name: "Tyler", age: 28, member: true, studio_id: studio1.id)

        visit "/yogis/#{tyler.id}"

        expect(page).to have_content(tyler.name)
        expect(page).to have_content(tyler.age)
        expect(page).to have_content(tyler.member)
        expect(page).to have_content(tyler.studio_id)
        expect(page).to have_content(tyler.created_at)
        expect(page).to have_content(tyler.updated_at)
      end
    end
  end
end
