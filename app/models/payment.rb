class Payment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :payment_groups, dependent: :destroy
  has_many :groups, through: :payment_groups

  validates :name, presence: true, length: { minimum: 4, maximum: 250 }
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
