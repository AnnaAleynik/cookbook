class ApplicationPolicy < ActionPolicy::Base
  authorize :user, allow_nil: true

  alias_rule :new?, to: :create?
  alias_rule :edit?, to: :update?

  private

  def manager?
    user&.manager?
  end

  def common_user?
    user&.common?
  end
end
