class User < ApplicationRecord
  has_secure_password

  has_many :reports, dependent: :destroy

  validates :name, presence: true, length: { in: 2..20 }
  validates :email, presence: true, length: { in: 5..40 }, uniqueness: true
  validates :password, length: { in: 6..12 }, allow_nil: true

end
