class IngredientPolicy < ApplicationPolicy
  def create?
    manager?
  end
end
