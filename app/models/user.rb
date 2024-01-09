class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_many :groups, dependent: :destroy

  validates :name, presence: true, length: { minimum: 4, maximum: 250 }
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 8 }
  validate :password_complexity

  def password_complexity
    return if password.blank?

    complexity_errors = []

    complexity_errors << 'one uppercase letter' unless password =~ /[A-Z]/
    complexity_errors << 'one lowercase letter' unless password =~ /[a-z]/
    complexity_errors << 'one digit' unless password =~ /[0-9]/
    complexity_errors << 'one special character' unless password =~ /[#?!@$%^&*-]/

    return if complexity_errors.empty?

    errors.add(:password,
               "Complexity requirement not met. The password needs at least: #{complexity_errors.join(', and ')}")
  end

  # override devise confiramable for now
  def confirmation_required?
    false
  end
end
