class User < ApplicationRecord
  extend Enumerize
  
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  AVAILABLE_ROLES = %w(admin manager common).freeze

  enumerize :role, in: AVAILABLE_ROLES, predicates: true, default: :common

  scope :admin, -> { where(role: "admin") }
end
