class ApplicationPolicy < ActionPolicy::Base
  authorize :user, allow_nil: true

  alias_rule :edit?, :destroy?, to: :update?

  def create?
    false
  end

  def update?
    false
  end

  private

  def manager?
    user&.manager?
  end

  def moderator?
    user&.moderator?
  end

  def coordinator?
    user&.coordinator?
  end

  def author?
    record.author == user
  end
end
