class User < ApplicationRecord
  extend Enumerize
  AVAILABLE_ROLES = %w(admin manager common).freeze

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_many :recipes, foreign_key: :author_id

  enumerize :role, in: AVAILABLE_ROLES, predicates: true, default: :common

  scope :admin, -> { where(role: "admin") }
end
