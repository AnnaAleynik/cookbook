module Users
  class InvitationPolicy < ApplicationPolicy
    def create?
      manager?
    end

    def update?
      true
    end
  end
end
