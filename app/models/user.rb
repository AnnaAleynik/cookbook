class User < ApplicationRecord
  extend Enumerize
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  AVAILABLE_ROLES = %w(admin manager common).freeze

  enumerize :role, in: AVAILABLE_ROLES, predicates: true, default: :common

  scope :admin, -> { where(status: "admin") }
end
