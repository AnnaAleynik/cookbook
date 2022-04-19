module Users
  class InvitationsController < Devise::InvitationsController
    before_action :configure_permitted_parameters, :authorize_resource!
    # before_action :authorize_user

    def create
      # Users::
    end

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:invite, keys: %w(first_name last_name login roles))
    end

    # def authorize_user
    #   authorize! current_user, to: :admin?
    # end
    def authorize_resource!
      authorize! current_user, with: InvitationPolicy
    end
  end
end
