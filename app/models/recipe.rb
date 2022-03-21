class Recipe < ApplicationRecord
  extend Enumerize

  AVAILABLE_STATUSES = %w(pending denied moderating approved).freeze

  enumerize :status, in: AVAILABLE_STATUSES, predicates: true, default: :pending

  belongs_to :author, class_name: "User"

  has_many :ingredient, through: :recipes_ingredients

  validates :title, :content, presence: true
  validates :title, length: { minimum: 3 }
end
