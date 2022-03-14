module Users
  class RecipePolicy < ApplicationPolicy
    def create?
      common_user?
    end

    def update?
      common_user? && record.author == user
    end

    def destroy?
      common_user? && record.author == user
    end
  end
end
