class IngredientPolicy < ApplicationPolicy
  def create?
    coordinator?
  end
end
