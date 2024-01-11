class Payment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :payment_groups, dependent: :destroy
  has_many :groups, through: :payment_groups
  accepts_nested_attributes_for :groups

  validates :name, presence: true, length: { within: 4..250 }
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :groups, presence: true
end
