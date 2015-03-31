require 'rails_helper'

feature 'restaurants' do
  context 'no restaurants have been added' do
    scenario 'should display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add a restaurant'
    end
  end

  context'displaying restaurants' do

    before do
      Restaurant.create(name: 'KFC')
    end

    scenario 'should display a restaurant that is added' do
      visit '/restaurants'
      expect(page).to have_content 'KFC'
      expect(page).not_to have_content 'No restaurants yet'
    end
  end

  context 'adding a restaurant' do
    scenario 'should add a restaurant' do
      visit '/restaurants'
      click_link 'Add a restaurant'
      fill_in('Name', :with => "KFC")
      click_button('Create Restaurant')
      expect(page).to have_content 'KFC'
      expect(page).not_to have_content 'No restaurants yet'
    end
  end

  context 'viewing a restaurant' do

    let!(:kfc){Restaurant.create(name:'KFC')}

    scenario 'should be able to view a restaurant description' do
      visit '/restaurants'
      click_link 'KFC'
      expect(page).to have_content 'KFC'
      expect(current_path).to eq "/restaurants/#{kfc.id}"
    end
  end

end