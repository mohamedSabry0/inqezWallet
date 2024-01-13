require 'rails_helper'

RSpec.describe 'Payments new', type: :feature, js: true do
  let(:user) { create(:user) }
  let(:group) { create(:group, user:) }

  before do
    user
    group
    login_user(user)
    click_on group.name
    click_on 'Add a new payment'
  end

  describe 'user interactions' do
    it 'should create a new payment with valid params' do
      fill_in 'Name', with: Faker::Name.name
      fill_in 'Amount', with: Faker::Number.decimal(l_digits: 2)
      check group.name
      click_on 'Save'

      expect(page).to have_content('Payment was successfully created.')
    end

    it 'should not create a new payment with invalid name' do
      fill_in 'Name', with: ''
      fill_in 'Amount', with: Faker::Number.decimal(l_digits: 2)
      check group.name
      click_on 'Save'

      message = page.find('#payment_name').native.attribute('validationMessage')
      expect(message).to eq('Please fill out this field.')
    end

    it 'should not create a new payment with invalid amount' do
      fill_in 'Name', with: Faker::Name.name
      fill_in 'Amount', with: ''
      check group.name
      click_on 'Save'

      message = page.find('#payment_amount').native.attribute('validationMessage')
      expect(message).to eq('Please fill out this field.')
    end

    it 'should not create a new payment without selecting a group' do
      fill_in 'Name', with: Faker::Name.name
      fill_in 'Amount', with: Faker::Number.decimal(l_digits: 2)
      uncheck group.name
      click_on 'Save'

      expect(page).to have_content('Categories: must include one at least.')
    end

    it 'should navigate to the payments page for that group' do
      fill_in 'Name', with: Faker::Name.name
      fill_in 'Amount', with: Faker::Number.decimal(l_digits: 2)
      check group.name
      click_on 'Save'

      expect(page).to have_content("Payments for #{group.name}")
    end

    it 'should navigate to the home page' do
      click_on '<'

      expect(page).to have_content(group.name)
    end
  end
end
