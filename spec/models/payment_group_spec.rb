require 'rails_helper'

RSpec.describe PaymentGroup, type: :model do
  describe 'associations' do
    it { should belong_to(:group) }
    it { should belong_to(:payment) }
  end
end
