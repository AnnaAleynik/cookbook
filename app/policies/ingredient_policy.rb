class IngredientPolicy < ApplicationPolicy
  def create
    user.manager?
  end
end
