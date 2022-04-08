module Users
  class RecipePolicy < ApplicationPolicy
    def update?
      author? || moderator?
    end

    def destroy?
      author?
    end
  end
end
