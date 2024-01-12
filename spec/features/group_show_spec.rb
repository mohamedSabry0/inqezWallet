require 'rails_helper'

RSpec.describe 'Group show page', type: :feature do
  let(:user) { create(:user) }
  let(:group) { create(:group, user:) }
  let(:payments) { create_list(:payment, 3, groups: [group], author_id: user.id) }

  before do
    user
    group
    payments
    login_user(user)
    visit root_path
    click_on group.name
  end

  describe 'user interactions' do
    it 'should navigate to the home page' do
      click_on '<'

      expect(page).to have_content('Categories')
    end

    it 'should navigate to the new payment page' do
      click_on 'Add a new payment'

      expect(page).to have_content('new payment')
    end
  end

  describe 'page content' do
    it 'user should see the total amount for the category' do
      expect(page).to have_content("Total Amount: $#{group.payments.sum(:amount)}")
    end

    it 'user should see the list of payments ordered by the most recent' do
      payments.reverse.each_with_index do |payment, index|
        expect(page).to have_selector(".payment:nth-child(n + #{index}) p.payment-title", text: payment.name)
      end
    end

    it 'user should see the amount of each payment' do
      payments.reverse.each_with_index do |payment, index|
        expect(page).to have_selector(".payment:nth-child(n + #{index}) p.payment-amount", text: payment.amount)
      end
    end

    it 'user should see the date of each payment' do
      payments.reverse.each_with_index do |payment, index|
        expect(page).to have_selector(".payment:nth-child(n + #{index}) p.payment-date",
                                      text: payment.created_at.strftime('%d %b %Y'))
      end
    end
  end
end
