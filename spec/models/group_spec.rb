require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:payment_groups).dependent(:destroy) }
    it { should have_many(:payments).through(:payment_groups) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(4).is_at_most(250) }
    it { should validate_presence_of(:icon) }
  end
end
