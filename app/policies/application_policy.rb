class ApplicationPolicy < ActionPolicy::Base
  authorize :user, allow_nil: true

  alias_rule :edit?, to: :update?

  private

  def manager?
    user&.manager?
  end

  def common_user?
    user&.common?
  end

  def author?
    record.author == user
  end
end
