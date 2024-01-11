require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:groups).dependent(:destroy) }
    it { should have_many(:payments).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(4).is_at_most(250) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password).is_at_least(8).is_at_most(128) }
  end

  describe 'methods' do
    let(:user) { FactoryBot.create(:user) }
    let(:user_with_unvalid_password) { FactoryBot.build(:user, password: '123') }

    before(:each) do
      user
    end

    describe '#password_complexity' do
      it 'should unvalidate password with unmet comlexity' do
        expect(user_with_unvalid_password.valid?).to eq(false)
      end
      it 'should show error message for password with unmet comlexity' do
        user_with_unvalid_password.valid?
        expect(user_with_unvalid_password.errors.messages[:password].last).to eq('Complexity requirement not met.'
        .concat(' The password needs at least: one uppercase letter, ')
        .concat('and one lowercase letter, and one special character'))
      end

      it 'should validate password with met comlexity' do
        expect(user.valid?).to eq(true)
      end
    end
  end
end
