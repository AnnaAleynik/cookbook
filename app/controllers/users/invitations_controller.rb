module Users
  class InvitationsController < Devise::InvitationsController
    before_action :configure_permitted_parameters, :authorize_resource!
    # before_action :authorize_user

    def create
      # Users::
      # InviteUserJob.perform

      if @user.errors.empty?
        binding.pry
      else
        render :new
      end
    end

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:invite, keys: %w(first_name last_name login roles))
    end

    def authorize_resource!
      authorize! current_user, with: InvitationPolicy
    end

    # def invite_resource
    #   binding.pry
    # end
  end
end
