require 'rails_helper'

RSpec.describe 'Groups index', type: :feature do
  let(:user) { create(:user) }
  let(:groups) { create_list(:group, 3, user:) }
  let(:payment) { create(:payment, author_id: user.id, groups:) }

  before do
    user
    groups
    payment
    login_user(user)
  end

  describe 'when user logs in' do
    it 'they are presented with the groups page' do
      expect(page).to have_content('Categories')
    end
  end

  describe 'group list' do
    it 'shows the name of the group' do
      groups.each do |group|
        expect(page).to have_content(group.name)
      end
    end

    it 'shows the icon of the group' do
      groups.each do |group|
        icon = group.icon.split('.').first
        expect(page).to have_css("img[src*='#{icon}']")
      end
    end

    it 'shows the total amount of all the transactions that belongs to that group' do
      groups.each do |group|
        expect(page).to have_content(group.payments.sum(:amount))
      end
    end

    it 'when the user clicks on a group item, the application navigates to the payments page for that group' do
      groups.each do |group|
        click_on group.name
        expect(page).to have_content("Payments for #{group.name}")
        visit groups_path
      end
    end

    it 'there is a button "add a new category" at the bottom
    that brings the user to the page to create a new category' do
      click_on 'Add a new category'
      expect(page).to have_content('New Category')
    end
  end
end
