module Users
  class InvitationsController < Devise::InvitationsController
    before_action :configure_permitted_parameters
    before_action :authenticate_user!, :authorize_resource!, only: %i(new create)

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:accept_invitation, keys: %i(login))
      devise_parameter_sanitizer.permit(:invite, keys: [:first_name, :last_name, roles: []])
    end

    def authorize_resource!
      authorize! current_user, with: InvitationPolicy
    end
  end
end
