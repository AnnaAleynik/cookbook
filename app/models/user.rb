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

  has_many :recipes, foreign_key: :author_id

  enumerize :roles, in: AVAILABLE_ROLES, multiple: true, predicates: true

  validates :email, presence: true
  validates :email, :login, uniqueness: true
  validates :login, presence: true, unless: :invited_to_sign_up?

  # login can be empty ONLY if invitation is sent & invitation_not_accepted

  scope :admin, -> { where("roles && ARRAY[?]::varchar[]", ADMIN_ROLES) }

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end
end
