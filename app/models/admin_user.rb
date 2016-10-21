class AdminUser < ApplicationRecord
  devise :database_authenticatable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :requests, dependent: :nullify
end
