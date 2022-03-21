class ProfilesController < ApplicationController
  def show
  end

  def edit
  end

  def update
    if current_user.update(users_params)
      redirect_to profile_path, notice: "Profile was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def users_params
      params.require(:user).permit(:email, :avatar)
    end
end