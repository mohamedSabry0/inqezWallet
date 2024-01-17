require 'rails_helper'

RSpec.describe 'registration', type: :feature, js: true do
  describe 'registration' do
    before do
      visit root_path
      click_on 'Sign up'
    end

    it 'should register a new user with valid params' do
      valid_password = Faker::Internet.password(min_length: 8, max_length: 20, mix_case: true, special_characters: true)
      fill_in 'Name', with: Faker::Name.name
      fill_in 'Email', with: Faker::Internet.email
      fill_in 'Password', with: valid_password
      fill_in 'Password confirmation', with: valid_password
      click_on 'Sign up'

      expect(page).to have_content('Welcome! You have signed up successfully.')
    end

    it 'should not register a new user with invalid params' do
      fill_in 'Name', with: ''
      fill_in 'Email', with: ''
      fill_in 'Password', with: ''
      fill_in 'Password confirmation', with: ''
      click_on 'Sign up'

      message = page.find('#user_name').native.attribute('validationMessage')
      expect(message).to eq('Please fill out this field.')
    end

    it 'should not register a new user with invalid password' do
      fill_in 'Name', with: Faker::Name.name
      fill_in 'Email', with: Faker::Internet.email
      fill_in 'Password', with: '123'
      fill_in 'Password confirmation', with: '123'
      click_on 'Sign up'

      expect(page).to have_content('Password Complexity requirement not met. The password needs at least: '
        .concat('one uppercase letter, and one lowercase letter, and one special character'))
    end

    it 'should not register a new user with invalid password confirmation' do
      fill_in 'Name', with: Faker::Name.name
      fill_in 'Email', with: Faker::Internet.email
      fill_in 'Password', with: '123'
      fill_in 'Password confirmation', with: '1234'
      click_on 'Sign up'

      expect(page).to have_content("Password confirmation doesn't match Password")
    end

    it 'should not register a new user with invalid email' do
      fill_in 'Name', with: Faker::Name.name
      fill_in 'Email', with: 'test'
      fill_in 'Password', with: '123'
      fill_in 'Password confirmation', with: '123'
      click_on 'Sign up'

      message = page.find('#user_email').native.attribute('validationMessage')
      expect(message).to eq('Please include an \'@\' in the email address. \'test\' is missing an \'@\'.')
    end

    it 'should not register a new user with invalid name' do
      fill_in 'Name', with: '123'
      fill_in 'Email', with: Faker::Internet.email
      fill_in 'Password', with: '123'
      fill_in 'Password confirmation', with: '123'
      click_on 'Sign up'

      expect(page).to have_content('Name is too short (minimum is 4 characters)')
    end

    it 'should not register a new user with already taken email' do
      user = FactoryBot.create(:user)
      fill_in 'Name', with: Faker::Name.name
      fill_in 'Email', with: user.email
      fill_in 'Password', with: '123'
      fill_in 'Password confirmation', with: '123'
      click_on 'Sign up'

      expect(page).to have_content('Email has already been taken')
    end
  end
end
