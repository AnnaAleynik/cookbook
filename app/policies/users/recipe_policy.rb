module Users
  class RecipePolicy < ApplicationPolicy
    def create?
      true
    end

    def update?
      author? || moderator?
    end
  end
end
