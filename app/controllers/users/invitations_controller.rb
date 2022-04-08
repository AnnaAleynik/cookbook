module Users
  class InvitationsController < Devise::InvitationsController
    before_action :configure_permitted_parameters
    # before_action :authorize_user
    # verify_authorized

    def create
      # Users::
    end

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:invite, keys: %w(first_name last_name roles))
    end

    # def authorize_user
    #   authorize! current_user, to: :admin?
    # end
  end
end
