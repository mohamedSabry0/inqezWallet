class Group < ApplicationRecord
  belongs_to :user
  has_many :payment_groups, dependent: :destroy
  has_many :payments, through: :payment_groups

  validates :name, presence: true, length: { within: 4..250 }
  validates :icon, presence: true
end
