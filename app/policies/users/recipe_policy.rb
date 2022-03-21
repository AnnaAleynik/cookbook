module Users
  class RecipePolicy < ApplicationPolicy
    def create?
      common_user?
    end

    def update?
      common_user? && author?
    end

    def destroy?
      common_user? && author?
    end
  end
end
