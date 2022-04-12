class User < ApplicationRecord
  extend Enumerize

  ADMIN_ROLES = %w(manager moderator coordinator).freeze
  AVAILABLE_ROLES = ADMIN_ROLES

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :invitable
        #  :confirmable

  has_many :recipes, foreign_key: :author_id

  enumerize :roles, in: AVAILABLE_ROLES, multiple: true, predicates: true

  validates :email, :login, presence: true
  validates :email, uniqueness: true

  scope :admin, -> { where("roles && ARRAY[?]::varchar[]", ADMIN_ROLES) }
end
