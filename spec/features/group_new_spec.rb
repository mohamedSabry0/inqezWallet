require 'rails_helper'

RSpec.describe 'Groups new', type: :feature, js: true do
  let(:user) { create(:user) }

  before do
    user
    login_user(user)
    visit root_path
    click_on 'Add a new category'
  end

  describe 'user fills out a form to create a new category' do
    it 'should create a new category with valid params' do
      fill_in 'Name', with: Faker::Name.name
      fill_in 'Icon', with: Faker::Internet.url
      click_on 'Save'

      expect(page).to have_content('Category was successfully created.')
    end

    it 'should not create a new category with invalid name' do
      fill_in 'Name', with: ''
      fill_in 'Icon', with: Faker::Internet.url
      click_on 'Save'

      message = page.find('#group_name').native.attribute('validationMessage')
      expect(message).to eq('Please fill out this field.')
    end

    it 'should not create a new category with invalid icon' do
      fill_in 'Name', with: Faker::Name.name
      fill_in 'Icon', with: ''
      click_on 'Save'

      message = page.find('#group_icon').native.attribute('validationMessage')
      expect(message).to eq('Please fill out this field.')
    end
  end

  describe 'user clicks on the "Back" button (<)' do
    it 'should navigate to the home page' do
      click_on '<'

      expect(page).to have_content('Categories')
    end
  end
end
