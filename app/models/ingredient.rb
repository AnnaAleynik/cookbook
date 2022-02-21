class Ingredient < ApplicationRecord
  has_many :recipe, through: :recipes_ingredients

  validates :title, presence: true
end
