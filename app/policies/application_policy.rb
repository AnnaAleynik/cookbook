# Base class for application policies
class ApplicationPolicy < ActionPolicy::Base
  private

  def manager?
    user.manager?
  end
end
