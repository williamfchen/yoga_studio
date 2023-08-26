require 'rails_helper'

RSpec.feature 'application layout' do
  describe 'as a visitor' do
    describe 'on any page' do
      it 'displays home link' do
        visit root_path
        
        expect(page).to have_link('Home', href: root_path)
      end
      
      it 'navigates to the root path' do
        visit root_path
        
        click_link('Home')
        expect(page).to have_current_path(root_path)
      end

      it 'US8 displays all studios link' do
        visit root_path
        
        expect(page).to have_link('All Studios', href: studios_path)
      end
      
      it 'US8 navigates to the studio index' do
        visit root_path

        click_link('All Studios')
        expect(page).to have_current_path(studios_path)
      end
      
      it 'US9 displays all yogis link' do
        visit root_path
        
        expect(page).to have_link('All Yogis', href: yogis_path)
      end

      it 'US9 navigates do the yogi index' do
        visit root_path

        click_link('All Yogis')
        expect(page).to have_current_path(yogis_path)
      end
    end
  end
end